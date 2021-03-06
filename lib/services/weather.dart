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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time in';
    } else if (temp > 20) {
      return 'Time for shorts and ๐ in';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค in';
    } else {
      return 'Bring a ๐งฅ just in case going to';
    }
  }
}
