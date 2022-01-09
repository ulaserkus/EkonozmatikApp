// ignore_for_file: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarTemplate extends StatelessWidget {
  AppBarTemplate(this.body, {Key? key}) : super(key: key);

  Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          leading: Builder(
            builder: (BuildContext context) {
              return const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.shop_two_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              );
            },
          ),
          title: const Text(
            "Ekonozmetik",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromRGBO(50, 205, 50, 1),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: const Text(
                  "Hakkımızda",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/about");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: const Text(
                  "Ürünler",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/products");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/contact");
                  },
                  child: const Text(
                    "İletişim",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 30,
                    )))
          ],
        ),
        backgroundColor: Colors.black,
        body: body,
        bottomNavigationBar: const SizedBox(
          height: 30,
          child: BottomAppBar(
            color: Color.fromRGBO(50, 205, 50, 1),
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Tüm Hakları Ekonozmetik markası altında Saklıdır @ 2022",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
