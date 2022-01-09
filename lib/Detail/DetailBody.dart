// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekonozmetik_webapp/Data/Data.dart';
import 'package:ekonozmetik_webapp/ErrorPage.dart';
import 'package:ekonozmetik_webapp/Templates/BodyTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

Data data = Data();
List<Widget> imageSliders = [];

class DetailBody extends StatefulWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments;
    Product product = getProductById(args.toString());
    return args != null
        ? BootstrapContainer(
            decoration: const BoxDecoration(color: Colors.amber),
            fluid: true,
            children: [
              BootstrapRow(
                children: [
                  BootstrapCol(
                    child: BodyTemplate(BootstrapRow(
                      height: pageHeight,
                      children: [
                        BootstrapCol(
                          child: ManuelSlider(id: args.toString()),
                          sizes: 'col-md-6',
                        ),
                        BootstrapCol(
                          child: DescriptionGroup(
                            id: args.toString(),
                            product: product,
                          ),
                          sizes: 'col-md-6',
                        )
                      ],
                    )),
                    sizes: 'col-md-12',
                  )
                ],
                height: pageHeight,
              )
            ],
          )
        : const ErrorPage(title: "Ürün Kodu bulunamadı");
  }
}

// ignore: must_be_immutable
class DescriptionGroup extends StatelessWidget {
  String id;
  Product product;
  DescriptionGroup({Key? key, required this.id, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(product.description)],
    );
  }
}

getProductById(String id) {
  List<Product> products = data.products;
  Product product;
  product = products.where((element) => element.id.toString() == id).first;
  return product;
}

// ignore: must_be_immutable
class ManuelSlider extends StatefulWidget {
  String id;

  ManuelSlider({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ManuelSliderState createState() => _ManuelSliderState(id: id);
}

class _ManuelSliderState extends State<ManuelSlider> {
  final CarouselController _controller = CarouselController();
  String id;
  _ManuelSliderState({required this.id});

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    getImagesById(id, pageHeight);
    return Column(children: <Widget>[
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            enlargeCenterPage: false, height: pageHeight * 55 / 100),
        carouselController: _controller,
      ),
      Container(
        margin: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () => _controller.previousPage(),
              child: const Text('←'),
            ),
            ElevatedButton(
              onPressed: () => _controller.nextPage(),
              child: const Text('→'),
            )
          ],
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Trendyola Git'),
      )
    ]);
  }
}

getImagesById(String id, double height) {
  List<String> imgList = [];
  for (var element in data.products) {
    if (element.id.toString() == id) {
      imgList.add(element.imageUrl);
      imgList.add(element.secondImageUrl);
    }
  }

  imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      height: height - height * 50 / 100,
                    ),
                  ],
                )),
          ))
      .toList();
}
