// ignore_for_file: file_names
import 'package:ekonozmetik_webapp/Contact/ContactBody.dart';
import 'package:ekonozmetik_webapp/Templates/AppBarTemplate.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarTemplate(const ContactBody());
  }
}