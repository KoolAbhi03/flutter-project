import 'package:flutter/material.dart';
import 'package:sample_proj/pages/winner.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int count = 0;
  int war = 0;
  List def = <int>[0, 0, 0, 0, 0, 0, 0, 0, 0];
  List ico = [
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
    Icon(Icons.edit_outlined),
  ];
  String win = 'None';
  Widget button(int x) {
    return (IconButton(
      onPressed: () {
        setState(() {
          if (count == 0 && def[x] == 0 && war == 0) {
            def[x] = 1;
            count = 1;
            ico[x] = Icon(Icons.star);
            if (winLogic(def)) {
              win = 'Player1';
              war = 1;
            }
          }
          if (count == 1 && def[x] == 0 && war == 0) {
            def[x] = 2;
            count = 0;
            ico[x] = Icon(Icons.circle);
            if (winLogic(def)) {
              win = 'Player2';
              war = 1;
            }
          }
        });
      },
      icon: ico[x],
      iconSize: 50,
      padding: EdgeInsets.all(6),
      alignment: Alignment.center,
    ));
  }

  Widget lineh() {
    return (Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 5.0,
        width: 100.0,
        color: Colors.grey[600],
      ),
    ));
  }

  Widget linev() {
    return (Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: Container(
        height: 100.0,
        width: 5.0,
        color: Colors.grey[600],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Game Begins!'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [button(0), linev(), button(1), linev(), button(2)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [lineh(), lineh()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [button(3), linev(), button(4), linev(), button(5)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [lineh(), lineh()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [button(6), linev(), button(7), linev(), button(8)],
              ),
              SizedBox(
                height: 50,
              ),
              Text('Winner: $win',
                  style: TextStyle(fontSize: 20, color: (Colors.green))),
              SizedBox(
                height: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Icon(Icons.refresh_outlined),
                backgroundColor: Colors.red,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Play Again!',
                style: TextStyle(fontSize: 20, color: (Colors.redAccent)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
