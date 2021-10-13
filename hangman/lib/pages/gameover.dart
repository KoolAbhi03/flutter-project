import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget {
  final word;
  const GameOverPage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HangMan'),
        ),
      ),
    );
  }
}
