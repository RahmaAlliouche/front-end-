import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});
}

class ProductListApp extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Dell laptop', image: 'image/dell.jpg'),
    Product(name: 'ideapad', image: 'image/len.png'),
    Product(name: 'iphone 14 pro max', image: 'image/iphon.png'),
    Product(name: 'iphone se 2022', image: 'images/galaxy.png'),
    Product(name: 'Samsung S23 ultra', image: 'images/appl.png')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products List'),
          backgroundColor: Colors.orangeAccent,
          actions: [Icon(Icons.phone_android), Icon(Icons.laptop)],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(products[index].image),
              title: Text(products[index].name),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
