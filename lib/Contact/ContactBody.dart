// ignore_for_file: file_names, must_be_immutable

import 'package:ekonozmetik_webapp/Templates/BodyTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBody extends StatefulWidget {
  const ContactBody({Key? key}) : super(key: key);

  @override
  _ContactBodyState createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  TextEditingController messageController = TextEditingController();

  launchMailto(String message) async {
    final mailtoLink = Mailto(
      to: ['ulaserkus99@gmail.com'],
      cc: ['uygaridare@gmail.com'],
      subject: 'mailto example subject',
      body: message,
    );
    // Convert the Mailto instance into a string.
    // Use either Dart's string interpolation
    // or the toString() method.
    await launch('$mailtoLink');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    return BootstrapContainer(
        fluid: true,
        decoration: const BoxDecoration(color: Colors.amber),
        children: [
          BootstrapRow(
            height: pageHeight,
            children: [
              BootstrapCol(
                child: BodyTemplate(SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 20),
                        height: 400,
                        child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: GoogleMapWidget()))),
                    Container(
                        margin:
                            const EdgeInsets.only(left: 50, right: 50, top: 20),
                        height: 400,
                        child: BootstrapRow(
                          height: 400,
                          children: [
                            BootstrapCol(
                              child: Form(
                                child: BootstrapRow(
                                  children: [
                                    BootstrapCol(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 60.0),
                                        child: TextFormField(
                                          controller: messageController,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText:
                                                  'Lütfen mesajınızı giriniz',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 50,
                                                      horizontal: 10)),
                                        ),
                                      ),
                                      sizes: "col-md-12",
                                    ),
                                    BootstrapCol(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 18.0),
                                        child: ElevatedButton(
                                          child: const Text('Gönder'),
                                          onPressed: () {
                                            launchMailto(
                                                messageController.text);

                                            messageController.text = "";
                                          },
                                        ),
                                      ),
                                      sizes: "col-md-12",
                                    ),
                                  ],
                                ),
                              ),
                              sizes: 'col-md-6',
                            ),
                            BootstrapCol(
                              child: Flex(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                direction: Axis.vertical,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Wrap(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        spacing: 5,
                                        runSpacing: 20,
                                        children: const [
                                          Text(
                                            "Adres : ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            "İletişim Numarası : ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            "+90(538)-379-18-68",
                                            style: TextStyle(fontSize: 14),
                                            textAlign: TextAlign.start,
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        direction: Axis.horizontal,
                                        children: const [
                                          IconButton(
                                              onPressed: null,
                                              icon: FaIcon(
                                                FontAwesomeIcons.facebook,
                                                color: Colors.blue,
                                                size: 30,
                                              )),
                                          IconButton(
                                              onPressed: null,
                                              icon: FaIcon(
                                                FontAwesomeIcons.instagram,
                                                size: 30,
                                                color: Colors.purple,
                                              )),
                                          IconButton(
                                              onPressed: null,
                                              icon: Icon(
                                                FontAwesomeIcons.youtube,
                                                size: 30,
                                                color: Colors.red,
                                              )),
                                        ]),
                                  ),
                                ],
                              ),
                              sizes: 'col-md-6',
                            )
                          ],
                        )),
                  ],
                ))),
                sizes: "col-md-12",
              ),
            ],
          )
        ]);
  }
}

class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget({Key? key}) : super(key: key);
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(41.015137, 28.979530);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ));
  }
}
