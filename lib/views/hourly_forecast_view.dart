// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/int.dart';
import 'package:weather_app/providers/hourly_weather_provider.dart';
import 'package:weather_app/utils/get_weather_icon.dart';
import 'package:weather_app/views/error_text.dart';
import 'package:weather_app/views/loader_widget.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(
      data: (hourlyWeather) {
        return SizedBox(
          height: 100.h,
          child: ListView.builder(
            itemCount: hourlyWeather.cnt,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final weather = hourlyWeather.list[index];
              return HourlyWeatherTile(
                  id: weather.weather[0].id,
                  hour: weather.dt.time,
                  temp: weather.main.temp.round(),
                  active: index == 0,
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: () => LoaderWidget(),
    );
  }
}

class HourlyWeatherTile extends StatelessWidget {
  final int id;
  final String hour;
  final int temp;
  final bool active;

  const HourlyWeatherTile({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w, top: 12.0.h, bottom: 12.0.h,),
      child: Material(
        color: active ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15.0),
        elevation: active ? 8 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(getWeatherIcon(weatherCode: id), width: 50.w,),
              SizedBox(width: 10.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hour, style: TextStyle(color: Colors.white),),
                  SizedBox(height: 5.h,),
                  Text("${temp}o", style: TextStyles.h3,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
