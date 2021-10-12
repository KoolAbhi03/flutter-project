import 'package:flutter/material.dart';

import 'main.dart';

class Opplate extends StatefulWidget {
  String str;
  List arr;
  Opplate({this.str, this.arr});
  @override
  _OpPlateState createState() => _OpPlateState();
}

class _OpPlateState extends State<Opplate> {
  Widget opButton(String s) {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              child: Text(
                '$s',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  widget.arr.add(widget.str);
                  widget.str = '';
                  widget.arr.add('$s');
                  print(widget.arr);
                });
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget numButton(String s) {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              child: Text(
                '$s',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  widget.str = widget.str + '$s';
                  print(widget.str);
                });
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              numButton('1'),
              numButton('4'),
              numButton('7'),
              numButton('.')
            ],
          ),
          Column(
            children: [
              numButton('2'),
              numButton('5'),
              numButton('8'),
              numButton('0')
            ],
          ),
          Column(
            children: [
              numButton('3'),
              numButton('6'),
              numButton('9'),
              opButton('/')
            ],
          ),
          Column(
            children: [
              opButton('+'),
              opButton('-'),
              opButton('X'),
              opButton('=')
            ],
          )
        ],
      ),
    );
  }
}
