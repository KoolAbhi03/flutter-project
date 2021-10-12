// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'components/horizontalListView.dart';
import 'components/products.dart';
import 'pages/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/kj1.jpg'),
          AssetImage('assets/1100368.png')
        ],
        dotSize: 5,
        dotSpacing: 15,
        indicatorBgPadding: 0,
        dotBgColor: Colors.transparent,
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ShopApp",
        ),
        centerTitle: false,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Kool Abhi'),
              accountEmail: Text('koolavi16@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                  title: Text('Shoppin Cart'),
                  leading:
                      Icon(Icons.shopping_cart, color: Colors.purpleAccent)),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Help'),
                leading: Icon(Icons.help, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          imageCarousel,
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
              ),
            ),
          ),
          HorizontaList(),
          Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Products",
              ),
            ),
          ),
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
