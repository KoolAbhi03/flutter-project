import 'package:brew_cafe/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authneticate extends StatefulWidget {
  @override
  _AuthneticateState createState() => _AuthneticateState();
}

class _AuthneticateState extends State<Authneticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
