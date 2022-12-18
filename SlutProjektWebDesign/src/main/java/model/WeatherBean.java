package model;

import java.text.DecimalFormat;

public class WeatherBean {
    private String cityStr;
    private String countryStr;
    private String cloudsStr;
    private String temperature;
    private String cityIDStr;


    public WeatherBean(String cityStr, String countryStr) {

        this.cityStr = cityStr;
        this.countryStr = countryStr;

    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {

        this.temperature = String.format("%.1f", (Double.parseDouble(temperature) -273.15));
    }
    public String getCityStr() {

        return cityStr.substring(0,1).toUpperCase() + cityStr.substring(1);
    }

    public String getCountryStr() {

        return  countryStr.substring(0,1).toUpperCase() + countryStr.substring(1);
    }

    public String getCloudsStr() {
        return cloudsStr;
    }

    public void setCloudsStr(String cloudsStr) {
        this.cloudsStr = cloudsStr;
    }

    public void setCityID(String cityIDStr) { this.cityIDStr = cityIDStr; }
    public String getCityID() {
        return cityIDStr; }

}
