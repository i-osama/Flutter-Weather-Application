import 'package:flutter/material.dart';
import 'package:weather_app/WeatherAppScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 84, 190, 86))),
      // const AppBarTheme(color: Color.fromARGB(255, 84, 190, 86))),
      home: const WeatherAppScreen(),
    );
  }
}
