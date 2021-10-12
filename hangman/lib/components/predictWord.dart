// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class PredictWord extends StatefulWidget {
  final int len;
  final List list;
  const PredictWord({Key? key, required this.list, required this.len})
      : super(key: key);

  @override
  _PredictWordState createState() => _PredictWordState();
}

class _PredictWordState extends State<PredictWord> {
  List<Widget> abc = List.generate(3, (index) => PredLetterGrid(letter: 'a'));
  int leng = 3;
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: leng, children: abc);
  }
}

class PredLetterGrid extends StatelessWidget {
  final letter;
  const PredLetterGrid({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [Text(letter), const Text('___')],
        ),
      ),
    );
  }
}
