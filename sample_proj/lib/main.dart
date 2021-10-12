import 'package:flutter/material.dart';
//import 'package:sample_proj/pages/game.dart';
//import 'package:sample_proj/pages/home.dart';
import 'package:sample_proj/pages/home.dart';
import 'package:sample_proj/pages/choose_location.dart';
//import 'package:sample_proj/pages/home.dart';
import 'package:sample_proj/pages/loading.dart';
//import 'quote.dart';
//import 'quote_card.dart';

/*void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/game': (context) => Game(),
      },
    ));
*/
void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));

/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> quotes = [
    Quote(author: 'auth 1', text: 'This is the first quote.'),
    Quote(author: 'auth 2', text: 'This is the second quote.'),
    Quote(author: 'auth 3', text: 'This is the third quote.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quote'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes.map((quote) {
          return QuoteCard(
              quote: quote,
              delete: () {
                setState(() {
                  quotes.remove(quote);
                });
              });
        }).toList(),
      ),
    );
  }
}*/
