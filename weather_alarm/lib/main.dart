// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SimilarProduct(),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  const SimilarProduct({Key? key}) : super(key: key);

  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
  var productList = [
    {
      'name': 'Balzer',
      'picture': 'assets/kj1.jpg',
      'old price': 5000,
      'price': 4000
    },
    {
      'name': 'Shirt',
      'picture': 'assets/kj1.jpg',
      'old price': 5000,
      'price': 4000
    },
    {
      'name': 'Pant',
      'picture': 'assets/kj1.jpg',
      'old price': 5000,
      'price': 4000
    },
    {
      'name': 'Trouser',
      'picture': 'assets/kj1.jpg',
      'old price': 5000,
      'price': 4000
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return SimilarProductGrid(
              productName: productList[index]['name'],
              image: productList[index]['picture'],
              oldPrice: productList[index]['old price'],
              newPrice: productList[index]['price']);
        });
  }
}

class SimilarProductGrid extends StatelessWidget {
  final productName, image, oldPrice, newPrice;
  const SimilarProductGrid(
      {Key? key,
      required this.productName,
      required this.image,
      required this.oldPrice,
      required this.newPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                      Text(
                        "\$$newPrice",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
