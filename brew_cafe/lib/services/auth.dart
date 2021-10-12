import 'package:brew_cafe/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebaseUSer

  Userr _userFromFirebaseUser(User user) {
    return user != null ? Userr(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Userr> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anony.
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in email & pass.

  // register with email & pass.

  //signout
}
