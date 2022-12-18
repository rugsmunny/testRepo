<%@ page import="model.WeatherBean" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <script src="./scripts/scripts.js"></script>
    <script src='//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/d3.min.js'></script>

    <title>Title</title>

    <%
        WeatherBean wBean = (WeatherBean) request.getAttribute("wBean");
    %>
    <script>window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];
    window.myWidgetParam.push({id: 2,cityid: '<%=wBean.getCityID()%>',appid: 'b904383e0cb531fe313068de52a606de',
        units: 'metric',containerid: 'openweathermap-widget-2',  });

    (function() {
        var script = document.createElement('script');script.async = true;script.charset = "utf-8";
        script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
        var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(script, s);  })();</script>

</head>
<body>

    <div style="display: flex; flex-direction: row; justify-content: space-between; margin: 2%;">
        <div id="inputform2" style="display: flex;  flex-direction: column; flex-wrap: nowrap;
align-items: start; justify-self: start; ">
            <p style="margin-top: 0; font-family: helvetica; font-weight: bolder;">
                The temperature right now in <%=wBean.getCityStr()%> is <%=wBean.getTemperature()%>°C with <%=wBean.getCloudsStr()%>.</p>


            <div style=" display: flex; flex-direction: column; justify-content: center;
align-items: center; align-content: center; padding: 10px 10px; border: solid 2px black; border-radius: 10px;">
                <form action="OWServlet" id="OWServlet" method="get" style="display: flex; flex-direction: column; justify-content: space-around;">
                    <input style="text-align: center; border-radius: 10px;" type="text" name="city" id="city" placeholder="City" required/><br/>
                    <input style="text-align: center; border-radius: 10px;" type="text" name="country" id="country" placeholder="Country" required/><br/>
                </form>
                <button style="align-self: flex-start"><span onclick="formAction2()" class="btn-img">SUBMIT</span></button>
                <button style="z-index: 6; cursor: pointer; background-color: transparent; width: 30%;  cursor: pointer;height: 110%; border: none;">
                </button>
            </div>
            <div>
<%
    Cookie[] cookie = request.getCookies();
    for (int i = 0; i < cookie.length; i++) {
        if ( cookie[i].getName().equals("acceptCookie")){
            String[] values = cookie[i].getValue().split(".");
            for (String value: values) {
                out.print("<p>" + value + "</p>");
            }

        }
    }

%>
            </div>
        </div>
        <div id="openweathermap-widget-2"></div>
    </div>

</body>
</html>
