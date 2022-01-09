// ignore_for_file: file_names
import 'package:ekonozmetik_webapp/Home/HomeBody.dart';
import 'package:ekonozmetik_webapp/Templates/AppBarTemplate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarTemplate(const HomeBody());
  }
}
