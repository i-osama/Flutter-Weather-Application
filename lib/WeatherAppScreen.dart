import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/hourly_weather_forecast.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});
  static const String AppName = "What's the Weather?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 1,
        title: const Text(
          AppName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print("Pressed");
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
          // Padding(
          //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          // child: GestureDetector(
          //     child: const Icon(
          //   Icons.refresh,
          //   color: Colors.white,
          // )),
          // child: InkWell(
          //     onTap: () {
          //       print("clicked");
          //     },
          //     child: Icon(
          //       Icons.refresh,
          //       color: Colors.white,
          //     )),
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        // ######################## Main body Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 30,

                // ----main card
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(children: [
                        Text(
                          "0°F",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Icon(
                          Icons.cloud_rounded,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Raining",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            // ---- weather forecast opitons
            const Text(
              "Forecast",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyWeatherForecast(
                    time: "9:20",
                    speed: 1200.2323,
                    icon: Icons.snowing,
                  ),
                  HourlyWeatherForecast(time: "10:20", speed: 400.2323),
                  HourlyWeatherForecast(
                    time: "11:20",
                    speed: 600.2323,
                    icon: Icons.water,
                  ),
                  HourlyWeatherForecast(time: "12:20", speed: 200.2323),
                  HourlyWeatherForecast(
                    time: "1:20",
                    speed: 800.2323,
                    icon: Icons.waves,
                  ),
                  HourlyWeatherForecast(time: "2:20", speed: 100.2323),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // ---- Additional information
            const Text(
              "Additional Information",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformation(
                  situation: "Humidity",
                  amount: 65.99,
                ),
                AdditionalInformation(
                  situation: "Wind speed",
                  amount: 90.01,
                  icon: Icons.wind_power,
                ),
                AdditionalInformation(
                  situation: "Pressure",
                  amount: 25.35,
                  icon: Icons.heat_pump,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
