import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/utils/app_responsive.dart';

class ForecastCard extends StatelessWidget {
  final String dayStr;
  final String iconUrl;
  final double temp;
  final double windSpeedKmh;

  const ForecastCard({
    super.key,
    required this.dayStr,
    required this.iconUrl,
    required this.temp,
    required this.windSpeedKmh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            dayStr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: AppConstants.roboto,
            ),
          ),
          Image.network(
            iconUrl,
            width: AppResponsive.width(40),
            height: AppResponsive.width(32),
            fit: BoxFit.cover,
          ),
          Text(
            '${temp.toStringAsFixed(0)}°C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: AppConstants.roboto,
            ),
          ),
          Text(
            '${windSpeedKmh.toStringAsFixed(2)} \n km/h',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppConstants.roboto,
            ),
          ),
        ],
      ),
    );
  }
}
