// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title;

  const ErrorPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        title,
        style: const TextStyle(fontSize: 50, color: Colors.red),
      )),
    );
  }
}
