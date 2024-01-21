import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  final String situation;
  final dynamic amount;
  final dynamic icon;
  const AdditionalInformation(
      {super.key,
      required this.situation,
      required this.amount,
      this.icon = Icons.water_drop});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            situation,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            amount.toStringAsFixed(2),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
