// ignore_for_file: file_names
import 'package:ekonozmetik_webapp/About/AboutBody.dart';
import 'package:ekonozmetik_webapp/Templates/AppBarTemplate.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarTemplate(const AboutBody());
  }
}
