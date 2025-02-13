


import 'package:flutter/material.dart';

import '../core/resources/color_manager.dart';
import '../features/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Barlow',
        scaffoldBackgroundColor: MyColors.white,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primary),
        useMaterial3: true,
      ),
      home: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(0.9)),
          child: SplashScreen()),
    );
  }
}
