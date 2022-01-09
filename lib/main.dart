import 'package:ekonozmetik_webapp/Contact/ContactPage.dart';
import 'package:ekonozmetik_webapp/Detail/DetailPage.dart';
import 'package:ekonozmetik_webapp/ErrorPage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:ekonozmetik_webapp/About/AboutPage.dart';
import 'package:ekonozmetik_webapp/Home/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  setPathUrlStrategy();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SafeArea(child: AboutPage()),
    initialRoute: '/about',
    routes: {
      '/about': (context) => const AboutPage(),
      '/products': (context) => const HomePage(),
      '/contact': (context) => const ContactPage(),
      '/detail': (context) => const DetailPage()
    },
    onUnknownRoute: (RouteSettings setting) {
      return MaterialPageRoute(builder: (context) {
        return const ErrorPage(title: "No matching pages");
      });
    },
  ));
}
