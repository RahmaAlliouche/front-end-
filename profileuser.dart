import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import 'liste.dart';

class MyProfe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EditeProfile(),
    );
  }
}

class EditeProfile extends StatefulWidget {
  @override
  _EditeProfileState createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  bool isobscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => listeproduct())));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('image/iphon.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            buildTextFiedl("full name", "Alliouche Rahma", false),
            buildTextFiedl("Age", "25", false),
            buildTextFiedl("Email", "yass.all@gmail.com", false),
            buildTextFiedl("Password", ".......", false),
            buildTextFiedl("Phone", "(+123)67856925", false),
          ]),
        ),
      ),
    );
  }

  Widget buildTextFiedl(
      String labeltext, String placegolder, bool ispasswordtextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordtextfield ? isobscurePass : false,
        decoration: InputDecoration(
          suffixIcon: ispasswordtextfield
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye, color: Colors.black),
                  onPressed: () {})
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labeltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placegolder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
