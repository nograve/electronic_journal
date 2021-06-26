import 'package:firebase_auth/firebase_auth.dart';

Future<User?> createAccount({required String email, required String password}) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final User? user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;

    if (user != null) {
      // print('Registration Successful');
      return user;
    } else {
      // print('Registration Failed');
      return user;
    }
  } catch (e) {
    // print(e);
    return null;
  }
}

Future<User?> signIn({required String email, required String password}) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final User? user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

    if (user != null) {
      // print('Login Successful');
      return user;
    } else {
      // print('Login Failed');
      return user;
    }
  } catch (e) {
    // print(e);
    return null;
  }
}

Future<User?> logOut() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
  } catch (e) {
    // print(e);
  }
}