// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_home/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../widgets/my_text_button.dart';

class LAMB extends StatefulWidget {
  final String roomName;

  // ignore: use_key_in_widget_constructors
  const LAMB({this.roomName});

  @override
  State<LAMB> createState() => _LAMBState();
}

class _LAMBState extends State<LAMB> {
  double myValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: backarrow,
                child: Column(children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                myValue;
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ]),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lamba",
                          style: kBodyText2,
                        ),
                        Text(
                          "" + widget.roomName,
                          style: kBodyText2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                      size: 280,
                                      angleRange: 240,
                                      customColors: CustomSliderColors(
                                        trackColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        progressBarColors: [
                                          Color.fromARGB(255, 251, 255, 0),
                                          Color.fromARGB(255, 218, 234, 240),
                                        ],
                                      ),
                                      infoProperties: InfoProperties(
                                        modifier: (double value) {
                                          final roundedValue =
                                              (value).ceil().toInt().toString();
                                          return '$roundedValue %';
                                        },
                                        bottomLabelText: "Işık",
                                        bottomLabelStyle: kBodyText,
                                      )),
                                  initialValue: 0,
                                  max: 100,
                                  min: 0,
                                  onChange: (double value) {
                                    // ignore: avoid_print
                                    print(value);
                                    myValue = value;
                                  }),
                              SizedBox(height: 15),
                              MyTextButton(
                                  buttonName: "Kaydet",
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  bgColor: Colors.black87,
                                  textColor: Colors.white)
                            ]),
                      ]),
                  /**/
                ]))));
  }
}
