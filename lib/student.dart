import 'package:electronic_journal/form_of_education.dart';
import 'package:electronic_journal/group.dart';
import 'package:electronic_journal/user_account.dart';

class Student extends UserAccount {
  Student(String email, String password, this._surname, this._name,
      this._patronymic, this._userName, this._userSurname, this._formOfEducation,
      this._phoneNumber, this._group, this._yearOfEntering, this._dateOfBirth,
      this._providedEmail, this._relativeSurname, this._relativeName, this._relativePatronymic,
      this._relativePhoneNumber) : super(email, password);

  String _surname, _name, _patronymic;
  String _userName, _userSurname;
  FormOfEducation _formOfEducation;
  String _phoneNumber;
  Group _group;
  int _yearOfEntering;
  DateTime _dateOfBirth;
  String _providedEmail;
  String _relativeSurname, _relativeName, _relativePatronymic;
  String _relativePhoneNumber;
}