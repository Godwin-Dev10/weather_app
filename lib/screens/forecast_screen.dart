// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/dateTime.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/hourly_forecast_view.dart';
import 'package:weather_app/views/weekly_forecast_view.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("Forecast Report", style: TextStyles.h1,),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today", style: TextStyles.h2,),
              Text(DateTime.now().dateTime, style: TextStyles.subtitleText,),
            ],
          ),
          SizedBox(height: 20,),
          HourlyForecastView(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Next Forecast", style: TextStyles.h1,),
              Icon(Icons.calendar_month_outlined, color: Colors.white,)
            ],
          ),
          SizedBox(height: 20,),
          WeeklyForecastView(),
        ],
      ),
    );
  }
}
