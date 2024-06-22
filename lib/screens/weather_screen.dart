// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/dateTime.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/views/error_text.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/hourly_forecast_view.dart';
import 'package:weather_app/views/loader_widget.dart';
import 'package:weather_app/views/weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(
      data: (weather) {
        return GradientContainer(
          children: [
            SizedBox(width: double.infinity,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(weather.name, style: TextStyles.h1,),
                SizedBox(height: 20.0.h,),
                Text(DateTime.now().dateTime, style: TextStyles.subtitleText,),
                SizedBox(height: 30.0.h,),
                SizedBox(
                  height: 260.h,
                  child: Image.asset("assets/icons/${weather.weather[0].icon.replaceAll("n", "d")}.png"),
                ),
                SizedBox(height: 40.0.h,),
                Text(weather.weather[0].description, style: TextStyles.h2,),
              ],
            ),
            SizedBox(height: 40.0.h,),
            WeatherInfo(weather: weather),
            SizedBox(height: 40.0.h,),

            // hourly forecast
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: TextStyles.h2,),
                TextButton(
                  onPressed: () {},
                  child: Text("View full forecast"),
                ),
              ],
            ),

            SizedBox(height: 15.0.h,),
            HourlyForecastView(),
          ],
        );
      },
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: () => LoaderWidget(),
    );
  }
}
