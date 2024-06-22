// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/models/famous_cities_model.dart';
import 'package:weather_app/screens/weather_detail_screen.dart';
import 'package:weather_app/views/famous_city_tile.dart';

class FamousCities extends StatelessWidget {
  const FamousCities({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: famousCities.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (context, index) {
        final city = famousCities[index];
        return InkWell(
          onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
               WeatherDetailScreen(cityName: city.name)));
          },
          child: FamousCityTile(
            city: city.name,
            index: index,
          ),
        );
      },
    );
  }
}
