import 'package:flutter/material.dart';

class DetailItemStatus extends StatelessWidget {
  final String initDesc;
  final String initText;
  final Color initBoxColor;
  const DetailItemStatus(
      {super.key,
      required this.initDesc,
      required this.initText,
      required this.initBoxColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          initDesc,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: initBoxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            initText,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
