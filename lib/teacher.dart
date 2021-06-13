import 'package:electronic_journal/user.dart';

class Teacher extends User {
  Teacher(String login, String password, this._surname, this._name, this._patronymic)
      : super(login, password);

  String _surname, _name, _patronymic;
}