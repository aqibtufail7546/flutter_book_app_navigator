import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_sliver_practise_1/onboarding_screen.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookShelf',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Merriweather',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.brown,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.brown,
          ),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}
