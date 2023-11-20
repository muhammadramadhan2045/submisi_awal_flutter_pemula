import 'package:flutter/material.dart';

class DetailItemPriority extends StatelessWidget {
  final String initDesc;
  final IconData initIcon;
  final Color iconColor;
  final String initText;
  const DetailItemPriority(
      {super.key,
      required this.initDesc,
      required this.initIcon,
      required this.iconColor,
      required this.initText});

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
        Row(
          children: [
            Icon(
              initIcon,
              color: iconColor,
            ),
            Text(
              initText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
