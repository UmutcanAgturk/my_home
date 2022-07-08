import 'package:flutter/material.dart';
import 'package:my_home/constants.dart';
import 'package:my_home/widgets/widget.dart';

// ignore: camel_case_types
class addMoods extends StatefulWidget {
  const addMoods({Key key}) : super(key: key);

  @override
  State<addMoods> createState() => _addMoodsState();
}

// ignore: camel_case_types
class _addMoodsState extends State<addMoods> {
  String _selectedTime;
  String _selectedTime2;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
    @override
    // ignore: unused_element
    Widget build(BuildContext context) => build(context);
  }

   Future<void> _show2() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime2 = result.format(context);
      });
    }
    @override
    // ignore: unused_element
    Widget build(BuildContext context) => build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: backarrow,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ]),
            ),
            const SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const MyTextField(hintText: "Mod Adı Ekle", inputType: TextInputType.text, controller: null,)
              ],
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: 75,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Başlangıç Saati",
                    style: kBodyText3,
                  ),
                  const Text(
                    "Bitiş Saati",
                    style: kBodyText3,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 75,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedTime ?? "" + _selectedTime.toString(),
                    style: kBodyText3,
                  ),
                  Text(
                    _selectedTime2 ?? "" + _selectedTime2.toString(),
                    style: kBodyText3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
                height: 75,
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: _show,
                      child: const Text("Giriş"),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                    ),
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: _show2,
                      child: const Text("Çıkış"),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                    )
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(
                    buttonName: "Kaydet", 
                    onTap:(){

                    }, 
                    bgColor: Colors.black87, 
                    textColor: Colors.white),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
