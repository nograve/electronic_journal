import 'package:electronic_journal/user_types/user_account.dart';

class AdminRepresentative extends UserAccount {
  AdminRepresentative(this._email) : super(_email);

  String _email;

  String get email => _email;
}