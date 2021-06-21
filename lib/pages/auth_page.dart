import 'package:electronic_journal/forms/auth_form.dart';
import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage(this._onSignIn, {Key? key}) : super(key: key);

  final Function(UserType userType) _onSignIn;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(widget._onSignIn),
    );
  }
}
