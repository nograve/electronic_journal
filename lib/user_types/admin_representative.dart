import 'package:electronic_journal/user_types/user_account.dart';

class AdminRepresentative extends UserAccount {
  AdminRepresentative(this._email) : super(_email);

  final String _email;

  @override
  String toString() {
    return 'email: $_email';
  }
}