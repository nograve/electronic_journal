import 'package:electronic_journal/user_types/user_account.dart';

class Teacher extends UserAccount {
  Teacher(this._email, this._surname, this._name, this._patronymic) : super(_email);

  String _email;
  String _surname, _name, _patronymic;

  String get email => _email;
  String get surname => _surname;
  String get name => _name;
  String get patronymic => _patronymic;
}