package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GetTheWeather;
import model.WeatherBean;

import java.io.IOException;
import java.net.HttpCookie;

@WebServlet(name = "OWServlet", value = "/OWServlet")
public class OWServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cityStr = request.getParameter("city");
        String countryStr = request.getParameter("country");

        WeatherBean wBean = new WeatherBean(cityStr, countryStr);

        GetTheWeather.getWeather(wBean);

        request.setAttribute("wBean", wBean);

        Cookie[] cookie = request.getCookies();
        for (int i = 0; i < cookie.length; i++) {
            if ( cookie[i].getName().equals("acceptCookie")){
                String oldValue = cookie[i].getValue();
                String newValue = cityStr + ", " + countryStr + ".";
                cookie[i].setValue(oldValue+newValue);
                response.addCookie(cookie[i]);
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
        rd.forward(request, response);
    }


}
