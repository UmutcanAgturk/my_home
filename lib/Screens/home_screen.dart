import 'package:flutter/material.dart';
import 'package:my_home/Screens/add_room.dart';
import 'package:my_home/Screens/mods.dart';
import 'package:my_home/Screens/room_details.dart';
import 'package:my_home/constants.dart';
import 'package:my_home/widgets/widget.dart';

// ignore: camel_case_types
class home_screen extends StatefulWidget {
  
  const home_screen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen> {
  // ignore: non_constant_identifier_names
  String UsarName;

  final List roomData = [
    {
      "roomName": "Living Room",
      "members": "asddassa",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Bed Room",
      "members": "asdsdadass",
      "devices": "5 Devices",
      "isActive": true
    },
    {
      "roomName": "Guest Room",
      "members": "fasfsafsasfd",
      "devices": "3 Devices",
      "isActive": false
    },
    {
      "roomName": "Kitchen Room",
      "members": "gasgasgsasfaf",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Kids Room",
      "members": "ewrrewfsdfb",
      "devices": "4 Devices",
      "isActive": true
    },
    {
      "roomName": "Balcony Room",
      "members": "gfdfgdbvdfk",
      "devices": "2 Devices",
      "isActive": false
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: backarrow,
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
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const addRoom()));
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Merhaba Kullanıcı:',
                      style: kBodyText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Yuvana Hoş Geldin',
                      style: kBodyText3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextButton(
                            buttonName: "Modlarım",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mods()));
                            },
                            bgColor: Colors.black87,
                            textColor: Colors.white),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                        'assets/icons/thermometer.png'),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        '24°C',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
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
                                    child: Image.asset(
                                        'assets/icons/humidity.png'
                                        ),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        '50%',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
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
                            ])
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.84,
                    ),
                    itemCount: roomData.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RoomDetails(
                                roomName: roomData[index]['roomName'],
                                members: roomData[index]['members'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                roomData[index]['roomName'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                roomData[index]['members'],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                roomData[index]['devices'],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
