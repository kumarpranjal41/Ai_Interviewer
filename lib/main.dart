import 'package:flutter/material.dart';
import 'package:ai/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Use ThemeData.dark() to set a dark theme
      home: Screen1(),
    );
  }
}
