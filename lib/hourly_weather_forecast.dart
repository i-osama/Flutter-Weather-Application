import 'package:flutter/material.dart';

class HourlyWeatherForecast extends StatelessWidget {
  final String time;
  final double speed;
  final dynamic icon;
  const HourlyWeatherForecast(
      {super.key,
      required this.time,
      required this.speed,
      this.icon = Icons.cloud});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(
              icon,
              size: 36,
            ),
            Text(
              speed.toStringAsFixed(2),
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
