import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:save/profile/lenevo/profileVendeurL.dart';
import 'package:save/profile/samsung/profileVendeur.dart';

import '../../liste.dart';

class lenevo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'profile',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = [
    'image/len.png',
    'image/lentow.png',
    'image/lentri.png',
    'image/lenfour.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Product',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => listeproduct()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1), // Adjust the padding here
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: CarouselSlider(
                  items: items.map((item) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child:
                            Image.network(item, fit: BoxFit.cover, width: 800),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Processeur :'),
                      subtitle: Text('Core™ i7-1355U de 13e génération'),
                    ),
                    ListTile(
                      title: Text('Mémoire :'),
                      subtitle: Text('Jusqu’à 16 Go de LPDDR5'),
                    ),
                    ListTile(
                      title: Text('Stockage :'),
                      subtitle: Text('128 Go UFS 3.1'),
                    ),
                    ListTile(
                      title: Text('Batterie :'),
                      subtitle:
                          Text('Compatible avec la technologie RapidCharge '),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VendeurL()),
                          );
                        },
                        icon: Icon(Icons.person),
                        color: Colors.orange,
                      ),
                      title: Text('Vendeur'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
