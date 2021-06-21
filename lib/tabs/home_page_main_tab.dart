import 'package:electronic_journal/buttons/add_user_button.dart';
import 'package:electronic_journal/buttons/logout_button.dart';
import 'package:electronic_journal/buttons/show_disciplines_list_button.dart';
import 'package:electronic_journal/buttons/show_my_disciplines_button.dart';
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
        return Column(
          children: [
            Row(
              children: [
                ShowMyDisciplinesButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.Teacher:
        return Column(
          children: [
            Row(
              children: [
                ShowStudentsButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.AdminRepresentative:
        return Column(
          children: [
            Row(
              children: [
                AddUserButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.Admin:
        return Column(
          children: [
            Row(
              children: [
                AddUserButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                ShowDisciplinesListButton(),
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
