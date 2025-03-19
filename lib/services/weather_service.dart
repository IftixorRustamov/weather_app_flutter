import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/app_constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherData> fetchWeatherData() async {
    String location = 'Tashkent';

    String url = '$baseUrl/forecast.json?key=$apiKey&q=$location&days=4&aqi=no';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data');
    }
    var data = jsonDecode(response.body);

    return WeatherData.fromJson(data);
  }
}
