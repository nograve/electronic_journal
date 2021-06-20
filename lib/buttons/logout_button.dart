import 'package:flutter/material.dart';

import '../auth_methods.dart';
import '../electronic_journal_app.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  _LogOutButtonState createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  void onLogOut() {
    logOut().then((user) {
      if (user == null) {
        setState(() {
          isSignedIn = false;
          userType = null;
        });
        print('User Role is $userType');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onLogOut,
      child: Column(
        children: [
          Icon(Icons.login),
          Text('Вийти'),
        ],
      ),
    );
  }
}
