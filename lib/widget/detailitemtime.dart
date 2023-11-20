import 'package:flutter/material.dart';

class DetailItemTime extends StatelessWidget {
  final String date;
  final IconData icon;
  const DetailItemTime({super.key, required this.date, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(
          date,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
