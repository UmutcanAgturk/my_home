import 'package:flutter/material.dart';
import '../widgets/widget.dart';
import 'package:my_home/constants.dart';

// ignore: camel_case_types
class addRoom extends StatefulWidget {
  const addRoom({Key key}) : super(key: key);

  @override
  _addRoomState createState() => _addRoomState();
}

final List roomAssets2 = [
  {
    "icon": "assets/icons/lamp.png",
    "title": "Lamp",
    "isActive": true,
  },
  {
    "icon": "assets/icons/tv.png",
    "title": "TV",
    "isActive": false,
  },
  {
    "icon": "assets/icons/air_condition.png",
    "title": "Air Conditioner",
    "isActive": true,
  },
  {
    "icon": "assets/icons/fridge.png",
    "title": "Fridge",
    "isActive": true,
    "subTitle": "Fırın var ise",
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "CCTV Cam.",
    "isActive": false,
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Computer.",
    "isActive": false,
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Perde.",
    "isActive": false,
  },
  {
    "icon": "assets/icons/cctv.png",
    "title": "Kumanda.",
    "isActive": false,
  },
];

// ignore: camel_case_types
class _addRoomState extends State<addRoom> {
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Oda Ekle",
                style: kBodyText2,
              ),
              const SizedBox(
                height: 10,
              ),
              const MyTextField(
                  hintText: "Oda Adı Giriniz", inputType: TextInputType.text, controller: null,)
            ],
          ),
          /* SizedBox(
            height: 10,
          ),*/
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: roomAssets2.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black54,
                            offset: Offset(3, 5),
                            blurRadius: 9,
                            spreadRadius: 1)
                      ]),
                  child: ListTile(
                    title: Text(roomAssets2[index]['title']),
                    leading: Image.asset(roomAssets2[index]['icon']),
                    trailing: Switch(
                      value: roomAssets2[index]['isActive'],
                      onChanged: (_value) {
                        setState(() {
                          roomAssets2[index]['isActive'] = _value;
                        });
                      },
                      activeTrackColor: Colors.red.shade300,
                      activeColor: Colors.red.shade800,
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextButton(
                  buttonName: "Kaydet",
                  onTap: () {
                    Navigator.pop(context);               

                  },
                  bgColor: Colors.black87,
                  textColor: Colors.white),
            ],
          ),
        ],
      ),
    ));
  }
}
