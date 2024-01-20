import 'package:flutter/material.dart';

class HourlyWeatherForecast extends StatelessWidget {
  const HourlyWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "3:30",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.cloud,
              size: 36,
            ),
            Text(
              "Humidity",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
