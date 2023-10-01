import 'package:flutter/material.dart';
import 'package:ai/screen1.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData.dark(), // Use ThemeData.dark() to set a dark theme
        home: details(),
      );
    });
  }
}
