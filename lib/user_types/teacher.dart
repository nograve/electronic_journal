import 'package:electronic_journal/user_types/user_account.dart';

class Teacher extends UserAccount {
  Teacher(String email, String password, this._surname, this._name, this._patronymic)
      : super(email, password);

  String _surname, _name, _patronymic;
}