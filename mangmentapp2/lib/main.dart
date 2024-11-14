import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_handling_app/pages/login_page.dart';
import 'Startingpages/splash_screen.dart'; // Import the splash screen
import 'package:project_handling_app/Startingpages/intropage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Splash screen route
        '/home': (context) => OnboardingScreen(),
        // Replace with your home screen
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
