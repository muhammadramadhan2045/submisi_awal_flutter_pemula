import 'dart:io';

import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit App'),
      content: const Text('Are you sure want to exit?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            //keluar dari aplikasi
            exit(0);
          },
          child: const Text('Exit'),
        ),
      ],
    );
  }
}
