import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/utils/app_responsive.dart';

class WeatherContainer extends StatelessWidget {
  final String weatherType;
  final String indicator;
  final IconData icon;

  const WeatherContainer({
    super.key,
    required this.icon,
    required this.weatherType,
    required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: AppResponsive.height(30),),
          Text(
            weatherType,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.roboto,
            ),
          ),
          Text(
            indicator,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: AppConstants.roboto,
            ),
          ),
        ],
      ),
    );
  }
}
