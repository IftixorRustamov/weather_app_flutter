import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/utils/app_responsive.dart';
import 'package:weather_app/widgets/weather_container.dart';
import '../models/weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherData data;

  const WeatherDisplay({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    String fullIconUrl = 'https:${data.currentIcon}';
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              fullIconUrl,
              fit: BoxFit.cover,
              height: AppResponsive.height(85),
              width: AppResponsive.width(85),
            ),
            Text(
              data.condition,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: AppResponsive.height(40),
                fontFamily: AppConstants.roboto,
              ),
            ),
            Text(
              ' ${data.temperature.toStringAsFixed(0)}°',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppResponsive.height(70),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: AppResponsive.height(60),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherContainer(
              icon: Icons.water_drop,
              weatherType: "HUMIDITY",
              indicator: '${data.humidity}%',
            ),
            WeatherContainer(
              icon: Icons.air,
              weatherType: "WIND",
              indicator: '${data.windSpeedKmh.toStringAsFixed(2)} km/h',
            ),
            WeatherContainer(
              icon: Icons.thermostat,
              weatherType: "FEELS LIKE",
              indicator: '${data.feelsLike.toStringAsFixed(0)}°',
            ),
          ],
        ),
      ],
    );
  }
}
