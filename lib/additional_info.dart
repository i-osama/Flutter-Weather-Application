import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.water_drop,
          size: 32,
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Text(
            "Humidity",
            style: TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            "92.55",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
