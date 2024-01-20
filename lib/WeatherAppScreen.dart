import 'package:flutter/material.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});
  static const String AppName = "What's the Weather?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
