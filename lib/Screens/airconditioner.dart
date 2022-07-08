// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import 'package:my_home/constants.dart';
import 'package:my_home/widgets/my_text_button.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// ignore: camel_case_types
class airConditioner extends StatefulWidget {
  final String roomName;

  // ignore: use_key_in_widget_constructors
  const airConditioner({
    this.roomName,
  });

  @override
  State<airConditioner> createState() => _airConditionerState();
}

String derege;
String derege2;

// ignore: camel_case_types
class _airConditionerState extends State<airConditioner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: backarrow,
      child: Column(
        children: [
          /*Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // ignore: unused_label
                      // derege: derege;
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))
              ])),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Klima",
                style: kBodyText2,
              ),
              Text(
                "" + widget.roomName,
                style: kBodyText2,
              ),
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        size: 280,
                        angleRange: 240,
                        customColors: CustomSliderColors(
                          trackColor: Color.fromARGB(255, 255, 255, 255),
                          progressBarColors: [
                            Color.fromARGB(255, 255, 75, 21),
                            Color.fromARGB(255, 251, 255, 0),
                            Color.fromARGB(255, 0, 183, 255),
                          ],
                        ),
                        infoProperties: InfoProperties(
                          modifier: (double value) {
                            final roundedValue =
                                (value).ceil().toInt().toString();
                                derege = roundedValue;
                            return '$roundedValue °C';
                            
                          },
                          bottomLabelText: "Klima Sıcaklık",
                          bottomLabelStyle: kBodyText,
                        )),
                    initialValue: 0,
                    max: 60,
                    min: -20,
                    onChange: (double value) {
                      // ignore: unused_local_variable
                      print(value);
                      derege = value.toString();
                    }),
                // ignore: prefer_const_constructors
                SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        size: 280,
                        angleRange: 240,
                        customColors: CustomSliderColors(
                          trackColor: Color.fromARGB(255, 255, 255, 255),
                          progressBarColors: [
                            Color.fromARGB(255, 0, 183, 255),
                            Color.fromARGB(255, 187, 137, 0),
                          ],
                        ),
                        infoProperties: InfoProperties(
                          bottomLabelText: "Klima Nem",
                          bottomLabelStyle: kBodyText,
                        )),
                    initialValue: 0,
                    max: 60,
                    min: -20,
                    onChange: (double value) {
                      print(value);
                      derege2 = value.toString();
                    }),
                SizedBox(
                  height: 15,
                ),
                MyTextButton(
                    buttonName: "Kaydet",
                    onTap: () {
                      Navigator.pop(context);
                     
                    },
                    bgColor: Colors.black87,
                    textColor: Colors.white)
              ],
            ),
          ]),
        ],
      ),
    ));
  }
}
