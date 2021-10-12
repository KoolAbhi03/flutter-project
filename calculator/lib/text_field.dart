import 'package:flutter/material.dart';

import 'main.dart';

class Opfield extends StatefulWidget {
  List arr;
  Opfield({this.arr});
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<Opfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('${widget.arr}'),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
