// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shopping_app/home.dart';

class ProductDetails extends StatefulWidget {
  final ProductName, ProductImage, ProductNewPrice, ProductOldPrice;
  const ProductDetails(
      {Key? key,
      required this.ProductName,
      required this.ProductImage,
      required this.ProductOldPrice,
      required this.ProductNewPrice})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('Fashion'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.ProductImage),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.ProductName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Rs. ${widget.ProductOldPrice}',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: Text(
                        'Rs. ${widget.ProductNewPrice}',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('Choose the size'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
                    Expanded(child: Text('Size')),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Color'),
                          content: Text('Choose the color'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
                    Expanded(child: Text('Color')),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Quantity'),
                          content: Text('Choose the quantity'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
                    Expanded(child: Text('Quantity')),
                    Expanded(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('Buy Now'))),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  ))
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(
                'czxbckzbcmnzbcnmzbcbzmnbcnmzbcnmzbcnmzbmncbznmcbznmbcnmzbcnmzbcnmzbnmcbzmncbmznxbcnmzxbcnmzxbcmnzcaslasjijaclkndcnsdckjnsdcnFCBSDBCLSBCALSBCBASLKBDCSLKBCDLBCLSBCLBSDCLBACASsdcasa'),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  '${widget.ProductName}',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Brand X',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'New',
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar products'),
          ),
          // Similar product

          Container(
            height: 360,
            child: SimilarProduct(),
          )
        ],
      ),
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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
