import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';

class HomePageAccountTab extends StatefulWidget {
  const HomePageAccountTab(this._userType, {Key? key}) : super(key: key);

  final UserType _userType;

  @override
  _HomePageAccountTabState createState() => _HomePageAccountTabState();
}

class _HomePageAccountTabState extends State<HomePageAccountTab> {
  @override
  Widget build(BuildContext context) {
    return const Text('Account information...');
  }
}
