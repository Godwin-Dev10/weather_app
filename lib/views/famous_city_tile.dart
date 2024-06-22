// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/utils/get_weather_icon.dart';
import 'package:weather_app/views/error_text.dart';
import 'package:weather_app/views/loader_widget.dart';

class FamousCityTile extends ConsumerWidget {
  final String city;
  final int index;

  const FamousCityTile({super.key, required this.city, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherByCityNameProvider(city));
    return weatherData.when(
      data: (weather) {
        return Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          elevation: index == 0 ? 8 : 0,
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${weather.main.temp.round().toString()}o", style: TextStyles.h2,),
                          SizedBox(height: 10,),
                          Text(weather.weather[0].description,
                            style: TextStyles.subtitleText, overflow: TextOverflow.ellipsis, maxLines: 2,),
                        ],
                      ),
                    ),
                    Image.asset(
                      getWeatherIcon(weatherCode: weather.weather[0].id),
                      width: 50,
                    ),
                  ],
                ),
                Text(weather.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Colors.white.withOpacity(.8),
                  ),),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: () => LoaderWidget(),
    );
  }
}
