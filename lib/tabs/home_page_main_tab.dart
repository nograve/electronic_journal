import 'package:electronic_journal/buttons/add_user_button.dart';
import 'package:electronic_journal/buttons/logout_button.dart';
import 'package:electronic_journal/buttons/show_students_button.dart';
import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';

class HomePageMainTab extends StatefulWidget {
  const HomePageMainTab(this._userType, this._onLogOut, {Key? key}) : super(key: key);

  final UserType _userType;
  final Function()? _onLogOut;

  @override
  _HomePageMainTabState createState() => _HomePageMainTabState();
}

class _HomePageMainTabState extends State<HomePageMainTab> {
  @override
  Widget build(BuildContext context) {
    switch (widget._userType) {
    // Create 2 columns for each row widget

      case UserType.Student:
        return Row(
          children: [
            Column(
              children: [
                ShowStudentsButton(),
                LogOutButton(widget._onLogOut),
              ],
            ),
          ],
        );

      case UserType.Teacher:
        return Row(
          children: [
            Column(
              children: [
                ShowStudentsButton(),
                LogOutButton(widget._onLogOut),
              ],
            ),
          ],
        );

      case UserType.AdminRepresentative:
        return Row(
          children: [
            Column(
              children: [
                ShowStudentsButton(),
                LogOutButton(widget._onLogOut),
              ],
            ),
          ],
        );

      case UserType.Admin:
        return Row(
          children: [
            Column(
              children: [
                AddUserButton(),
                ShowStudentsButton(),
              ],
            ),
            Column(
              children: [
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      default:
        return const Text('Помилка...');
    }
  }
}
