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

      case UserType.student:
        return Column(
          children: [
            Row(
              children: [
                const ShowMyDisciplinesButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                const ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.teacher:
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
                const ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.adminRepresentative:
        return Column(
          children: [
            Row(
              children: [
                const AddUserButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                const ShowDisciplinesListButton(),
                LogOutButton(widget._onLogOut),
              ],
            )
          ],
        );

      case UserType.admin:
        return Column(
          children: [
            Row(
              children: [
                const AddUserButton(),
                ShowStudentsButton(),
              ],
            ),
            Row(
              children: [
                const ShowDisciplinesListButton(),
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
