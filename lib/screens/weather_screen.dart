import 'package:flutter/material.dart';
import 'package:weather_app/widgets/location_indicator.dart';
import '../constants/app_constants.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../utils/app_responsive.dart';
import '../widgets/weather_display.dart';
import '../widgets/forecast_card.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherService weatherService = WeatherService();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1E3C72), Colors.blue, Colors.blueAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: LocationIndicator(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dehaze,
                color: Colors.white,
                size: AppResponsive.height(32),
              ),
            ),
          ],
        ),
        body: FutureBuilder<WeatherData>(
          future: weatherService.fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppResponsive.width(25),
                  vertical: AppResponsive.height(30),
                ),
                child: Column(
                  spacing: AppResponsive.height(16),
                  children: [
                    SizedBox(height: AppResponsive.height(25)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.currentDate,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppConstants.roboto,
                          ),
                        ),
                        Text(
                          data.updateTime,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontFamily: AppConstants.roboto,
                          ),
                        ),
                      ],
                    ),
                    WeatherDisplay(data: data),
                    Container(
                      height: AppResponsive.height(185),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResponsive.width(20),
                        vertical: AppResponsive.height(13),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[700]!.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.daily.length,
                        itemBuilder: (context, index) {
                          var day = data.daily[index];
                          var img = "https:${day.icon}";
                          return ForecastCard(
                            dayStr: day.dayStr,
                            iconUrl: img,
                            temp: day.temp,
                            windSpeedKmh: day.windSpeedKmh,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }
}
