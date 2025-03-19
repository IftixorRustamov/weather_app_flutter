import 'package:intl/intl.dart';

class ForecastDay {
  final String dayStr;
  final String icon;
  final double temp;
  final double windSpeedKmh;

  ForecastDay({
    required this.dayStr,
    required this.icon,
    required this.temp,
    required this.windSpeedKmh,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    String dateStr = json['date'];
    DateTime dayDate = DateFormat('yyyy-MM-dd').parse(dateStr);
    String dayStr = '${DateFormat('EEE').format(dayDate)} ${dayDate.day}';
    String icon = json['day']['condition']['icon'];
    double temp = json['day']['avgtemp_c'].toDouble();
    double windSpeedKmh = json['day']['maxwind_kph'].toDouble();

    return ForecastDay(
      dayStr: dayStr,
      icon: icon,
      temp: temp,
      windSpeedKmh: windSpeedKmh,
    );
  }
}

class WeatherData {
  final String condition;
  final double temperature;
  final int humidity;
  final double windSpeedKmh;
  final double feelsLike;
  final String updateTime;
  final String currentDate;
  final List<ForecastDay> daily;
  final String currentIcon;

  WeatherData({
    required this.condition,
    required this.temperature,
    required this.humidity,
    required this.windSpeedKmh,
    required this.feelsLike,
    required this.updateTime,
    required this.currentDate,
    required this.daily,
    required this.currentIcon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    // Extract current weather
    var current = json['current'];
    String condition = current['condition']['text'];
    double temperature = current['temp_c'].toDouble();
    int humidity = current['humidity'];
    double windSpeedKmh = current['wind_kph'].toDouble();
    double feelsLike = current['feelslike_c'].toDouble();
    String currentIcon = current['condition']['icon'];

    // Parse local time
    String localtimeStr = json['location']['localtime'];
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    DateTime updateDateTime = dateFormat.parse(localtimeStr);
    String updateTime =
        'Updated as of ${DateFormat('MM/dd/yyyy hh:mm a').format(updateDateTime)}';
    String currentDateStr = DateFormat('MMMM dd').format(updateDateTime);

    // Extract forecast data
    List<dynamic> forecastDays = json['forecast']['forecastday'];
    List<ForecastDay> daily =
        forecastDays.map((day) => ForecastDay.fromJson(day)).toList();

    return WeatherData(
      condition: condition,
      temperature: temperature,
      humidity: humidity,
      windSpeedKmh: windSpeedKmh,
      feelsLike: feelsLike,
      updateTime: updateTime,
      currentDate: currentDateStr,
      daily: daily,
      currentIcon: currentIcon, // Include current icon
    );
  }
}
