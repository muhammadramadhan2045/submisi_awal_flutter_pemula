import 'package:flutter/material.dart';

class SubHeadingItem extends StatelessWidget {
  final String task;
  final bool haveText;
  final String count;
  final String lengthList;
  const SubHeadingItem(
      {super.key,
      required this.task,
      required this.haveText,
      required this.count,
      required this.lengthList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            '$task Task',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          haveText == true
              ? Text(
                  '$count/$lengthList Tasks',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
