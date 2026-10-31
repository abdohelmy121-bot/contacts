import 'dart:async';
import 'package:contact/core/app_colors.dart';
import 'package:contact/screens/homescreen.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return homescreen();
          },
        ),
      );
    });
    return Scaffold(
      backgroundColor: appcolors.DarkBlue,
      body: SafeArea(
        child: Center(child: Image.asset("assets/images/Group 6.png")),
      ),
    );
  }
}
