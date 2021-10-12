import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int oprnd = -1, dot = 0;
  int state = 0;
  int opcd = -1;
  dynamic res = -1, result;
  List operand = <dynamic>[];
  List opcode = <String>[];
  dynamic operation() {
    dynamic temp = 0;
    if (res == -1 && (oprnd + opcd) % 2 == 1 && (oprnd + opcd >= 1)) {
      res = operand[0];
      for (var i = 1; i < operand.length; i++) {
        temp = operand[i];
        if (opcode[i - 1] == '+') {
          res = res + temp;
        } else if (opcode[i - 1] == '-') {
          res = res - temp;
        } else if (opcode[i - 1] == 'X') {
          res = res * temp;
        } else {
          res = res / temp;
        }
      }
    }
    print(res);
    return res;
  }

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
                  if (operand.isEmpty != true &&
                      s != '=' &&
                      operand.length == opcode.length + 1) {
                    opcode.add(s);
                    opcd += 1;
                    state = 0;
                    print(opcode);
                  }
                  if (s == '=') {
                    result = operation();
                    operand = [result];
                    oprnd = 0;
                    state = 0;
                    opcd = -1;
                    res = -1;
                    opcode = <String>[];
                  }
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

  Widget numButton(int s) {
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
                  if (dot == 1) {}
                  if (state == 0) {
                    state = 1;
                    operand.add(0);
                    oprnd += 1;
                    operand[oprnd] = operand[oprnd] * 10 + s;
                    print(operand);
                  } else {
                    operand[oprnd] = operand[oprnd] * 10 + s;
                    print(opcode);
                  }
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

  Widget opPlate() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              clear(),
              numButton(1),
              numButton(4),
              numButton(7),
              opButton('00')
            ],
          ),
          Column(
            children: [
              backspace(),
              numButton(2),
              numButton(5),
              numButton(8),
              numButton(0)
            ],
          ),
          Column(
            children: [
              opButton('%'),
              numButton(3),
              numButton(6),
              numButton(9),
              dotButton()
            ],
          ),
          Column(
            children: [
              opButton('/'),
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

  Widget clear() {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: Text(
                'C',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  oprnd = -1;
                  state = 0;
                  opcd = -1;
                  res = -1;
                  operand = <dynamic>[];
                  opcode = <String>[];
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

  Widget dotButton() {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              child: Text(
                '.',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (dot == 0) {
                    dot = 1;
                  }
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

  Widget backspace() {
    return Column(
      children: [
        Row(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.backspace),
              onPressed: () {
                setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          operand.isEmpty
              ? Text(
                  '0',
                  style: TextStyle(fontSize: 20),
                )
              : Text(
                  operand.join(' '),
                  style: TextStyle(fontSize: 20),
                ),
          SizedBox(
            height: 20,
          ),
          opPlate(),
        ],
      ),
    ));
  }
}
