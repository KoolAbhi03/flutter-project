import 'package:brew_cafe/models/user.dart';
import 'package:brew_cafe/screens/wrapper.dart';
import 'package:brew_cafe/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(StreamProvider<Userr>.value(
    value: AuthService().user,
    child: MaterialApp(
      home: Wrapper(),
    ),
  ));
}
