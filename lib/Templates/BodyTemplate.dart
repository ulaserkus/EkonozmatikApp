// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyTemplate extends StatelessWidget {
  BodyTemplate(this.view, {Key? key}) : super(key: key);

  Widget view;
  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: pageHeight - 160,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 0))
      ], color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
      child: view,
    );
  }
}
