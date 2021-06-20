import 'package:electronic_journal/user_types/user_account.dart';

class Teacher extends UserAccount {
  Teacher(String email, this._surname, this._name, this._patronymic)
      : super(email);

  String _surname, _name, _patronymic;
}