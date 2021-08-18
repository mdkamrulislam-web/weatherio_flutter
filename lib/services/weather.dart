import 'package:weatherio/services/networking.dart';
import 'package:weatherio/services/location.dart';
import 'package:weatherio/API_KEY.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getTypedCityWeather(String tCityName) async {
    var tURL = '$openWeatherMapURL?q=$tCityName&appid=$API_KEY&units=metric';
    NetworkHelper networkHelper = NetworkHelper(tURL);

    var tWeatherData = await networkHelper.fetchData();
    return tWeatherData;
  }

//api.openweathermap.org/data/2.5/weather?q=London&appid=
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');

    var weatherData = await networkHelper.fetchData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case going to';
    }
  }
}
