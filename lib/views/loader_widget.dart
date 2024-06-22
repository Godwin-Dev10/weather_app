import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(child: CircularProgressIndicator(),);
  }
}
