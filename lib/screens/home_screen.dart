// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentPageIndex = 0;

  final _screens = [
    WeatherScreen(),
    SearchScreen(),
    ForeCastScreen(),
  ];

  final _destinations = [
    NavigationDestination(
        icon: Icon(Icons.home_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.home, color: Colors.white,), label: ""),
    NavigationDestination(
        icon: Icon(Icons.search_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.search, color: Colors.white,), label: ""),
    NavigationDestination(
        icon: Icon(Icons.wb_sunny_outlined, color: Colors.white,),
        selectedIcon: Icon(Icons.wb_sunny, color: Colors.white,), label: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack,
        ),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
