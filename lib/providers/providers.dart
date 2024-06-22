import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';

import '../services/api_helper.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose((ref) {
  return ApiHelper.getWeeklyForecast();
});

final hourlyWeatherProvider = FutureProvider.autoDispose((ref) {
  return ApiHelper.getHourlyForecast();
});

final weatherByCityNameProvider = FutureProvider.autoDispose.family<Weather, String>((ref, String cityName) async {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});

final currentWeatherProvider = FutureProvider.autoDispose((ref) {
  return ApiHelper.getCurrentWeather();
});