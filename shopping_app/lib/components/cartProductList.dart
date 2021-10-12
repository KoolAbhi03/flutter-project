// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var Products_In_Cart = [
    {
      'name': 'Balzer',
      'size': 'M',
      'color': Colors.pink,
      'quantity': 1,
      'picture': 'assets/kj1.jpg',
      'price': 4000
    },
    {
      'name': 'Balzer',
      'size': 'M',
      'color': Colors.pink,
      'quantity': 1,
      'picture': 'assets/kj1.jpg',
      'price': 4000
    },
    {
      'name': 'Balzer',
      'size': 'M',
      'color': Colors.pink,
      'quantity': 1,
      'picture': 'assets/kj1.jpg',
      'price': 4000
    },
    {
      'name': 'Balzer',
      'size': 'M',
      'color': Colors.pink,
      'quantity': 1,
      'picture': 'assets/kj1.jpg',
      'price': 4000
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_In_Cart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
              ProductName: Products_In_Cart[index]['name'],
              ProductColor: Products_In_Cart[index]['color'],
              ProductImage: Products_In_Cart[index]['picture'],
              ProductPrice: Products_In_Cart[index]['price'],
              ProductQty: Products_In_Cart[index]['quantity'],
              ProductSize: Products_In_Cart[index]['size']);
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final ProductName,
      ProductSize,
      ProductColor,
      ProductQty,
      ProductImage,
      ProductPrice;
  const SingleCartProduct(
      {Key? key,
      required this.ProductName,
      required this.ProductColor,
      required this.ProductImage,
      required this.ProductPrice,
      required this.ProductQty,
      required this.ProductSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.asset(
        ProductImage,
        width: 80,
        height: 80,
      ),
      title: Text(ProductName),
      subtitle: Column(children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  "Size:",
                  style: TextStyle(color: Colors.grey),
                )),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                ProductSize,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Text(
                  "Color:",
                  style: TextStyle(color: Colors.grey),
                )),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.circle,
                color: ProductColor,
                size: 18,
              ),
            ),
          ],
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              "\$$ProductPrice",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            )),
      ]),
      trailing: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                )),
            Text(
              "$ProductQty",
              style: TextStyle(fontSize: 24),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
        ),
      ),
    ));
  }
}
