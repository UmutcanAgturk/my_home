// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_home/Screens/airconditioner.dart';
import 'package:my_home/Screens/lamb.dart';
import 'package:my_home/Screens/room_details_settings.dart';
import 'package:my_home/constants.dart';

class RoomDetails extends StatefulWidget {
  final String roomName;
  final String members;
  final String derege;
  final String derege2;

  RoomDetails({this.roomName, this.members, this.derege,this.derege2});

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  bool isSwitched = false;

  final List<dynamic> roomAssets = [
    {
      "icon": "assets/icons/lamp.png",
      "title": "Lamp",
      "subTitle": "65% brightness",
      "isActive": true
    },
    {
      "icon": "assets/icons/tv.png",
      "title": "TV",
      "subTitle": "32% Volume",
      "isActive": false
    },
    {
      "icon": "assets/icons/air_condition.png",
      "title": "Air Conditioner",
      "subTitle": "24 °C",
      "isActive": true
    },
    {
      "icon": "assets/icons/fridge.png",
      "title": "Fridge",
      "subTitle": "5°C Temperature",
      "isActive": true
    },
    {
      "icon": "assets/icons/cctv.png",
      "title": "CCTV Cam.",
      "subTitle": "Left/Right: 96.4° & Up/Down: 86.2°",
      "isActive": false
    },
    
  ];

  void odasayfa(String ad) {
    switch (ad) {
      case "Lamp":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LAMB(
                      roomName: widget.roomName,
                    )));
        break;
      case "Air Conditioner":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    airConditioner(roomName: widget.roomName)));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: backarrow,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          roomDetailsSettings()));
                            })
                      ]),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.roomName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    widget.members,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/icons/thermometer.png'),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                '24 °C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'SICAKLIK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/icons/humidity.png'),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                '24%',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'NEM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                          leading: Image.asset(roomAssets[index]['icon']),
                          title: Text(roomAssets[index]['title']),
                          subtitle: Text(roomAssets[index]['subTitle']),
                          onTap: () {
                            odasayfa(roomAssets[index]['title']);
                          }),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
