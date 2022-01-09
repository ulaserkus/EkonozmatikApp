// ignore_for_file: file_names, unused_import
import 'dart:math';
import 'package:ekonozmetik_webapp/Templates/BodyTemplate.dart';
import 'package:ekonozmetik_webapp/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

Data data = Data();
String filter = "";

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double offset = 0.0;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        offset = _scrollController.offset;
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;

    return BootstrapContainer(
      decoration: const BoxDecoration(color: Colors.amber),
      fluid: true,
      children: [
        pageWidth > 1250
            ? BootstrapRow(height: pageHeight, children: [
                BootstrapCol(
                  child: BodyTemplate(returnCategories()),
                  sizes: "col-md-2",
                ),
                BootstrapCol(
                  child: BodyTemplate(returnProducts(filter)),
                  sizes: "col-md-10",
                )
              ])
            : BootstrapRow(height: pageHeight, children: [
                BootstrapCol(
                  child: BodyTemplate(returnProducts(filter)),
                  sizes: "col-md-12",
                )
              ])
      ],
    );
  }

  Widget returnCategories() {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.all_inclusive_rounded)),
            tileColor: const Color.fromRGBO(50, 205, 50, 1),
            title: const Text("Tüm Ürünler"),
            onTap: () {
              setState(() {
                filter = "";
              });
            },
          ),
        ),
        Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            leading: const Icon(Icons.face_outlined),
            tileColor: const Color.fromRGBO(50, 205, 50, 1),
            title: const Text("Kozmetik"),
            onTap: () {
              setState(() {
                filter = "kozmetik";
                returnProducts(filter);
              });
            },
          ),
        ),
        Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            leading: const Icon(Icons.clean_hands_outlined),
            tileColor: const Color.fromRGBO(50, 205, 50, 1),
            title: const Text("Hijyen"),
            onTap: () {
              setState(() {
                filter = "hijyen";
                returnProducts(filter);
              });
            },
          ),
        )
      ],
    );
  }

  Widget returnProducts(String filter) {
    List<Product> products = data.products;

    if (filter != "") {
      products =
          products.where((element) => element.categoryName == filter).toList();
    } else {
      products = data.products;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      width: double.maxFinite,
                      child: Center(
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                products[index].imageUrl,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(50, 205, 50, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      products[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      products[index].price.toString() +
                          " " +
                          products[index].currency,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      buttonPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange),
                            child: const Text("İncele"),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "/detail",
                                  arguments: products[index].id);
                            }),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange),
                            child: const Text("Trendyol'a git "),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
