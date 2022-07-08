// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../widgets/widget.dart';
import '../constants.dart';

import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController PassControl = TextEditingController();
  TextEditingController PhoneControl = TextEditingController();
  TextEditingController eMailControl = TextEditingController();
  bool passwordVisibility = true;
  TextEditingController usernameControl = TextEditingController();

@override
void initState(){
  //getData();
}

  String get UserName => usernameControl.text;

  String get Pass => PassControl.text;

  String get Phone => PhoneControl.text;

  String get eMail => eMailControl.text;

  getData() async {
    var url = 'http://172.20.10.3/TestLocalHost/getData.php';
    var res = await http.get(url);
    var reponBody = json.decode(res.body);
    print(reponBody);
    return reponBody;
  }

insertData() async{
  var url = 'http://172.20.10.3/TestLocalHost/insertData.php';
    var res = await http.post(Uri.encodeFull(url),headers: {"Accept":"application/json"},
    body: {
      "kulad":UserName,
      "email":eMail,
      "telefon":Phone,
      "Sifre":Pass,
    }
    );
    var reponBody = json.decode(res.body);
   
    return reponBody;

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: backarrow,
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kayıt Ol",
                            style: kHeadline,
                          ),
                          Text(
                            "Başlamak için yeni hesap oluşturun.",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            hintText: 'İsim',
                            inputType: TextInputType.name,
                            controller: usernameControl,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            controller: eMailControl,
                          ),
                          MyTextField(
                            hintText: 'Telefon',
                            inputType: TextInputType.phone,
                            controller: PhoneControl,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: PassControl,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                          /* TextField(
                              controller: usernameControl,
                              decoration: InputDecoration(
                                hintText: "Kullanıcı İsmi",
                              )),
                          TextField(
                              controller: PhoneControl,
                              decoration: InputDecoration(
                                hintText: "Telefon",
                              )),
                          TextField(
                              controller: eMailControl,
                              decoration: InputDecoration(
                                hintText: "Email",
                              )),
                          TextField(
                              controller: PassControl,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ))*/
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hesabınız var mı? ",
                          style: kBodyText,
                        ),
                        Text(
                          "Giriş Yap",
                          style: kBodyText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyTextButton(
                      buttonName: 'Kayıt Ol',
                      onTap: () {
                        insertData();
                      },
                      bgColor: Colors.white,
                      textColor: Colors.black87,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
