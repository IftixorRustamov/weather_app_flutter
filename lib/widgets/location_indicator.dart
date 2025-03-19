import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_constants.dart';

import '../utils/app_responsive.dart';

class LocationIndicator extends StatelessWidget {
  const LocationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: Colors.white,
          size: AppResponsive.height(32),
        ),
        Text(
          "Tashkent",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: AppConstants.roboto,
          ),
        ),
      ],
    );
  }
}
