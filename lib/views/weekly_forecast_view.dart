// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/dateTime.dart';
import 'package:weather_app/providers/weekly_weather_provider.dart';
import 'package:weather_app/utils/get_weather_icon.dart';
import 'package:weather_app/views/error_text.dart';
import 'package:weather_app/views/loader_widget.dart';
import 'package:weather_app/views/superScriptText.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);
    return weeklyForecastData.when(
      data: (weeklyWeather) {
        return ListView.builder(
          itemCount: weeklyWeather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek = DateTime.parse(weeklyWeather.daily.time[index]).dayOfWeek;
            final date = weeklyWeather.daily.time[index];
            final temp = weeklyWeather.daily.temperature2mMax[index];
            final icon = weeklyWeather.daily.weatherCode[index];
            return WeeklyWeatherTile(
              day: dayOfWeek,
              date: date,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          },
        );
      },
      error: (error, stackStrace) => ErrorText(error: error.toString()),
      loading: () => LoaderWidget(),
    );
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  final String day;
  final String date;
  final int temp;
  final String icon;

  const WeeklyWeatherTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 12,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(day, style: TextStyles.h3,),
              SizedBox(height: 5,),
              Text(date, style: TextStyles.subtitleText,),
            ],
          ),
          SuperScriptText(
            text: temp.toString(),
            superScript: "oC",
            color: AppColors.white,
            superScriptColor: AppColors.grey,
          ),
          Image.asset(icon, width: 60,),
        ],
      ),
    );
  }
}

