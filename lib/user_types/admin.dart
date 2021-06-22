import 'package:electronic_journal/user_types/user_account.dart';

class Admin extends UserAccount {
  Admin(this._email) : super(_email);

  String _email;

  String get email => _email;

  @override
  String toString() {
    return 'email: $_email';
  }
}