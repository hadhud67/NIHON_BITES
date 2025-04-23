import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushi Man',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}