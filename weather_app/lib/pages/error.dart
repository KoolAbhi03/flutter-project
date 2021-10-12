import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Unable to get data try again after some time!',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
