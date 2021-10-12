// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hangman/pages/game.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'HangMan',
          style: TextStyle(
            color: Colors.purple[50],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple[100],
        child: Center(
          child: MaterialButton(
            height: 60,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Game()));
            },
            color: Colors.deepPurple[300],
            child: Text(
              'Play',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
