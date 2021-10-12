// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shopping_app/components/cartProductList.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Cart'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ]),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white70,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text('Total Amount: '),
              subtitle: Text(
                '\$230',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            )),
            Expanded(
                child: MaterialButton(
              height: 50,
              onPressed: () {},
              child: Text(
                'Check Out',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ))
          ],
        ),
      ),
    );
  }
}
