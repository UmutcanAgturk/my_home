// ignore_for_file: use_key_in_widget_constructors, camel_case_types, annotate_overrides, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_home/constants.dart';
import 'package:my_home/widgets/widget.dart';

class roomDetailsSettings extends StatefulWidget {
  _roomDetailsSettingsState createState() => _roomDetailsSettingsState();
}

final List roomAssets = [
  {
    "icon": "assets/icons/lamp.png",
    "title": "Lamb",
    "isActive": true
  },
  {
    "icon": "assets/icons/tv.png",
    "title": "TV",
    "isActive": false
  },
  {
    "icon": "assets/icons/air_condition.png",
    "title": "Air Conditioner",
    "isActive": true
  },
  {
    "icon": "assets/icons/fridge.png",
    "title": "Fridge",
    "isActive": true
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "CCTV Cam.",
    "isActive": false
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Computer.",
    "isActive": false
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Perde.",
    "isActive": false
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Kumanda.",
    "isActive": false
  },
];

class _roomDetailsSettingsState extends State<roomDetailsSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: backarrow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Oda Düzenle",
                  style: kBodyText2,
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                    hintText: "Oda Adı Giriniz", inputType: TextInputType.text, controller: null,)
              ],
            ),
          ),
          /* SizedBox(
            height: 10,
          ),*/
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: roomAssets.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(3, 5),
                              blurRadius: 9,
                              spreadRadius: 1)
                        ]),
                    child: ListTile(
                    title: Text(roomAssets[index]['title']),
                    leading: Image.asset(roomAssets[index]['icon']),
                    trailing: Switch(
                      value: roomAssets[index]['isActive'],
                      onChanged: (_value) {
                        setState(() {
                          roomAssets[index]['isActive'] = _value;
                        });
                      },
                      activeTrackColor: Colors.red.shade300,
                      activeColor: Colors.red.shade800,
                    ),
                    selected: roomAssets[index]['isActive'],
                    selectedColor: Colors.red.shade800,
                  ),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: MyTextButton(
                      buttonName: "Kaydet",
                      onTap: () {},
                      bgColor: Colors.white,
                      textColor: Colors.black87),
                ),
                Expanded(
                  child: MyTextButton(
                      buttonName: "Sil",
                      onTap: () {},
                      bgColor: Colors.black,
                      textColor: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
