// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/dateTime.dart';
import 'package:weather_app/extensions/strings.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/views/error_text.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/loader_widget.dart';
import 'package:weather_app/views/weather_info.dart';

class WeatherDetailScreen extends ConsumerWidget {
  final String cityName;

  const WeatherDetailScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityNameProvider(cityName));
    return weatherData.when(
      data: (weather) {
        return GradientContainer(
          children: [
            SizedBox(width: double.infinity,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(weather.name, style: TextStyles.h1,),
                SizedBox(height: 20.0,),
                Text(DateTime.now().dateTime, style: TextStyles.subtitleText,),
                SizedBox(height: 30.0,),
                SizedBox(
                  height: 260,
                  child: Image.asset("assets/icons/${weather.weather[0].icon.replaceAll("n", "d")}.png"),
                ),
                SizedBox(height: 40.0,),
                Text(weather.weather[0].description.capitalize, style: TextStyles.h2,),
              ],
            ),
            SizedBox(height: 40.0,),
            WeatherInfo(weather: weather),
          ],
        );
      },
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: () => LoaderWidget(),
    );
  }
}