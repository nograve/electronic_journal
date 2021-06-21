import 'package:flutter/material.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton(this._onLogOut, {Key? key}) : super(key: key);

  final Function()? _onLogOut;

  @override
  _LogOutButtonState createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget._onLogOut,
      child: Column(
        children: [
          Icon(Icons.login),
          Text('Вийти'),
        ],
      ),
    );
  }
}
