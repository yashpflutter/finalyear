import 'package:flutter/material.dart';
import 'package:mangmentv101/pages/loginregister/login_page.dart';
import 'package:mangmentv101/provider/manProvider.dart';
import 'package:mangmentv101/provider/theme/theme_provider.dart';
import 'package:mangmentv101/provider/credentialprovider/loginprovider.dart';
import 'package:provider/provider.dart';
import 'pages/Startingpages/splash_screen.dart'; // Import the splash screen

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => projectprovider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Splash Screen Example',
            theme: themeProvider.themeData,
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(), // Splash screen route

              '/login': (context) => LoginPage(), // Example login route
            },
          );
        },
      ),
    );
  }
}
