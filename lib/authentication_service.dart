import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  AuthenticationService(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }
  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Авторизовано успішно";
    } on FirebaseAuthException catch (ex) {
      return ex.message;
    }
  }
}