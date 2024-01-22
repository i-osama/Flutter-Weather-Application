import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/hourly_weather_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secret.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});
  static const String AppName = "What's the Weather?";

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  @override
  void initState() {
    super.initState();

    getWeatherData();
  }

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      String city = "Korea";
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$AppId"));

      dynamic data = jsonDecode(response.body);
      // print(response.body);
      if (data['cod'] != '200') {
        throw "An unexpected error occured!";
      }

      // dynamic tempData = data['list'][0]['main']['temp'];
      // print("Temp: ${tempData.toString()}");
      return data;
    } catch (e) {
      throw "Error occured: ${e.toString()}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 1,
        title: const Text(
          WeatherAppScreen.AppName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  getWeatherData();
                });
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
      body: FutureBuilder(
        future: getWeatherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final double currentTemp = currentWeatherData['main']['temp'];
          final String currentSky = currentWeatherData['weather'][0]['main'];

          final currentPressure = currentWeatherData['main']['pressure'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];

          return Padding(
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
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(children: [
                            Text(
                              "${currentTemp.toString()} K",
                              style: const TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Icon(
                              currentSky == "Clouds" || currentSky == "Rain"
                                  ? Icons.cloud_rounded
                                  : Icons.sunny,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              currentSky,
                              style: const TextStyle(
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

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0; i < 5; i++)
                //         HourlyWeatherForecast(
                //             time: data['list'][i + 1]['dt'].toString(),
                //             speed: data['list'][i + 1]['wind']['speed'],
                //             icon: iconSelector(
                //                 data['list'][i + 1]['weather'][0]['main']))

                //       // HourlyWeatherForecast(
                //       //   time: "9:20",
                //       //   speed: 1200.2323,
                //       //   icon: Icons.snowing,
                //       // ),
                //       // HourlyWeatherForecast(time: "10:20", speed: 400.2323),
                //       // HourlyWeatherForecast(
                //       //   time: "11:20",
                //       //   speed: 600.2323,
                //       //   icon: Icons.water,
                //       // ),
                //       // HourlyWeatherForecast(time: "12:20", speed: 200.2323),
                //       // HourlyWeatherForecast(
                //       //   time: "1:20",
                //       //   speed: 800.2323,
                //       //   icon: Icons.waves,
                //       // ),
                //       // HourlyWeatherForecast(time: "2:20", speed: 100.2323),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final hourlyforecast =
                            DateTime.parse(data['list'][index + 1]['dt_txt']);

                        return HourlyWeatherForecast(
                            // time: data['list'][index + 1]['dt'].toString(),
                            time: DateFormat('j')
                                .format(hourlyforecast)
                                .toString(),
                            speed: data['list'][index + 1]['wind']['speed'],
                            icon: iconSelector(
                                data['list'][index + 1]['weather'][0]['main']));
                      }),
                ),
                const SizedBox(height: 12),
                // ---- Additional information
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInformation(
                      situation: "Humidity",
                      amount: currentHumidity,
                    ),
                    AdditionalInformation(
                      situation: "Wind speed",
                      amount: currentWindSpeed,
                      icon: Icons.wind_power,
                    ),
                    AdditionalInformation(
                      situation: "Pressure",
                      amount: currentPressure,
                      icon: Icons.heat_pump,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  iconSelector(data) {
    if (data == "Clouds") {
      return Icons.cloud;
    } else if (data == "Rain") {
      return Icons.umbrella;
    } else {
      return Icons.sunny;
    }
  }
}
