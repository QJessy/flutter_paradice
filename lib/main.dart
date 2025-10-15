import 'package:flutter/material.dart';
import 'package:paradice/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Para\'Dice par Jessy Quarez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2E7D32)),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
