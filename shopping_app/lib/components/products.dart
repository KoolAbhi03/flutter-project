// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProductGrid(
                productName: productList[index]['name'],
                image: productList[index]['picture'],
                oldPrice: productList[index]['old price'],
                newPrice: productList[index]['price']),
          );
        });
  }
}

class ProductGrid extends StatelessWidget {
  final productName, image, oldPrice, newPrice;
  const ProductGrid(
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        ProductName: productName,
                        ProductImage: image,
                        ProductOldPrice: oldPrice,
                        ProductNewPrice: newPrice,
                      ))),
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
