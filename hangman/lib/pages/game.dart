// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hangman/components/letter.dart';
import 'package:hangman/components/predictWord.dart';
import 'package:hangman/pages/home.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<bool> pressed = [];
  int lives = 5;
  int hangstate = 0;
  bool gameOver = false;
  int temp_size = 0;
  String word = 'IMPORTANT';
  List pressalpha = [];
  List predletter = [];
  Widget Alphabutton(index) {
    return LetterGrid(
      index: alphabet[index],
      onpress: pressed[index] == false ? () => onpress(index) : null,
    );
  }

  void GameOver() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  onpress(int index) {
    if (lives == 0) {
      GameOver();
    }

    setState(() {
      pressalpha.add(alphabet[index]);
      pressed[index] = true;
    });
    bool check = false;
    for (int i = 0; i < word.length; i++) {
      if (alphabet[index] == word[i]) {
        check = true;
        setState(() {
          predletter[i] = word[i];
          temp_size += 1;
        });
      }
    }

    if (temp_size == word.length) {
      GameOver();
    }
    print(predletter);
    print(pressalpha);
    if (!check) {
      setState(() {
        lives -= 1;
      });
      if (lives == 0) {
        GameOver();
      }
    }
  }

  void init() {
    pressed = List.generate(26, (index) => false);
    predletter = List.generate(word.length, (index) => '');
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: ListView(children: [
        Image.asset('kj1.jpg'),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            ...(predletter).map((i) {
              return PredLetterGrid(letter: i);
            }),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 2, 8, 10),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TableRow(children: [
                TableCell(
                  child: Alphabutton(0),
                ),
                TableCell(
                  child: Alphabutton(1),
                ),
                TableCell(
                  child: Alphabutton(2),
                ),
                TableCell(
                  child: Alphabutton(3),
                ),
                TableCell(
                  child: Alphabutton(4),
                ),
                TableCell(
                  child: Alphabutton(5),
                ),
                TableCell(
                  child: Alphabutton(6),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Alphabutton(7),
                ),
                TableCell(
                  child: Alphabutton(8),
                ),
                TableCell(
                  child: Alphabutton(9),
                ),
                TableCell(
                  child: Alphabutton(10),
                ),
                TableCell(
                  child: Alphabutton(11),
                ),
                TableCell(
                  child: Alphabutton(12),
                ),
                TableCell(
                  child: Alphabutton(13),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Alphabutton(14),
                ),
                TableCell(
                  child: Alphabutton(15),
                ),
                TableCell(
                  child: Alphabutton(16),
                ),
                TableCell(
                  child: Alphabutton(17),
                ),
                TableCell(
                  child: Alphabutton(18),
                ),
                TableCell(
                  child: Alphabutton(19),
                ),
                TableCell(
                  child: Alphabutton(20),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Alphabutton(21),
                ),
                TableCell(
                  child: Alphabutton(22),
                ),
                TableCell(
                  child: Alphabutton(23),
                ),
                TableCell(
                  child: Alphabutton(24),
                ),
                TableCell(
                  child: Alphabutton(25),
                ),
                TableCell(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  ),
                ),
                TableCell(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  ),
                ),
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
