// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;

  const RoundTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.accentBlue,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, top: 10),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          )
        ),
      ),
    );
  }
}
