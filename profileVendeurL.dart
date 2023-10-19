import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'lenevo.dart';

class VendeurL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Url',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vendeur'),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lenevo()),
              );
            },
          ),
        ),
        body: Column(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 22.0, left: 15),
                child: Text(
                  'Contact us :',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.orangeAccent,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Card(
            child: InkWell(
              onTap: () => _sendEmail(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'hind@gmail.com',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => launchSms(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.sms,
                      color: Colors.purpleAccent,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      '+12367377479',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => launchTel(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      '+1234567779',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => _openMaps(),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.map,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Uv 17 nouvelle vile ',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  _sendEmail() async {
    // Remplacez l'adresse e-mail du destinataire par la vôtre
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'hind@gmail.com',
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir l\'application de messagerie.';
    }
  }

  dynamic launchTel() async {
    try {
      Uri telUri = Uri(
        scheme: 'tel',
        path: "+1234567779",
      );
      await launchUrl(telUri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dynamic launchSms() async {
    try {
      Uri smsUri = Uri(
        scheme: 'sms',
        path: "+12367377479",
      );
      await launchUrl(smsUri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _openMaps() async {
    // Remplacez les coordonnées par celles de votre choix
    final String coords = "Uv 17 nouvelle vile ";

    String url = "https://www.google.com/maps/search/?api=1&query=$coords";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir l\'application de cartographie.';
    }
  }
}
