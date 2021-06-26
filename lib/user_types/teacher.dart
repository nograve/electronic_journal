import 'package:electronic_journal/user_types/user_account.dart';

class Teacher extends UserAccount {
  Teacher(this._email, this._surname, this._name, this._patronymic) : super(_email);

  final String _email;
  final String _surname, _name, _patronymic;

  String get surname => _surname;
  String get name => _name;
  String get patronymic => _patronymic;

  @override
  String toString() {
    return 'email: $_email';
  }
}