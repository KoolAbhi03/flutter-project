import 'package:brew_cafe/models/user.dart';
import 'package:brew_cafe/screens/authenticate/authenticate.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);
    print(user);
    //return either Home or authneticate
    return Authneticate();
  }
}
