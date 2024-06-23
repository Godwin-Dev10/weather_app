// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/views/famous_cities.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/location_icon.dart';
import 'package:weather_app/views/round_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Pick Location", style: TextStyles.h1,),
              SizedBox(height: 10,),
              Text("Find the area or current city that you want to know the detailed weather info at this time",
                style: TextStyles.subtitleText, textAlign: TextAlign.center,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: RoundTextField(controller: _controller),
              ),
              SizedBox(width: 15,),
              LocationIcon(),
            ],
          ),
          SizedBox(height: 20,),
          // famous cities view
          FamousCities(),
        ],
      ),
    );
  }
}
