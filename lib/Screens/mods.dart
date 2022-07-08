// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_home/Screens/add_mods.dart';
import 'package:my_home/constants.dart';

class Mods extends StatefulWidget {
  @override
  State<Mods> createState() => _ModsState();
}

final List roomAssets3 = [
  {
    
    "title": "Gece Modu",
    "isActive": true,
    "hour": "18.00 - 06.00"
  },
  {
    
    "title": "Dışarı Modu",
    "isActive": false,
    "hour": "12.00 - 18.00"
  },
  
];

class _ModsState extends State<Mods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        margin: backarrow,
        child: Row(
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
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addMoods()));
                })
          ],
        ),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Modlarım",
              style: kBodyText,
            ),
          ],

        ),
      ),
      Container(
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: roomAssets3.length,
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
                      title: Text(roomAssets3[index]['title']),
                      subtitle: Text(roomAssets3[index]["hour"]),
                      trailing: Switch(
                        value: roomAssets3[index]['isActive'],
                         onChanged: (_value) {
                        setState(() {
                          roomAssets3[index]['isActive'] = _value;
                        });
                      },
                      activeTrackColor: Colors.red.shade300,
                      activeColor: Colors.red.shade800,
                    ),
                    selected: roomAssets3[index]['isActive'],
                    selectedColor: Colors.red.shade800,
                      ),
                    );
              }))
    ])));
  }
}
