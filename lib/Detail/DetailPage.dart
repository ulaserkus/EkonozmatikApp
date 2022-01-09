// ignore_for_file: file_names

import 'package:ekonozmetik_webapp/Detail/DetailBody.dart';
import 'package:ekonozmetik_webapp/Templates/AppBarTemplate.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarTemplate(const DetailBody());
  }
}
