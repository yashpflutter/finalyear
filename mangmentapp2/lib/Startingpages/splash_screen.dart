import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // After the splash screen, navigate to the main screen
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, // Background color
        body: Center(
          child: ClipOval(
            child: Image.asset(
              'assets/splash.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Adjusts the image to fit within the circle
            ),
          ),
        ));
  }
}
