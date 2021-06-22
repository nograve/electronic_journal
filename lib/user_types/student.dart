import 'package:electronic_journal/data_types/form_of_education.dart';
import 'package:electronic_journal/data_types/group.dart';
import 'package:electronic_journal/user_types/user_account.dart';

class Student extends UserAccount {
  Student(String email, this._surname, this._name, this._patronymic, this._userName,
      this._userSurname, this._formOfEducation, this._status, this._educationalLevel,
      this._phoneNumber, this._group, this._yearOfEntering, this._dateOfBirth,
      this._providedEmail, this._relativeSurname, this._relativeName, this._relativePatronymic,
      this._relativePhoneNumber) : super(email);


  String _surname, _name, _patronymic;
  String _userName, _userSurname;
  FormOfEducation _formOfEducation;
  String _status;
  String _educationalLevel;
  String _phoneNumber;
  Group _group;
  int _yearOfEntering;
  DateTime _dateOfBirth;
  String _providedEmail;
  String _relativeSurname, _relativeName, _relativePatronymic;
  String _relativePhoneNumber;

  String get surname => _surname;
  String get name => _name;
  String get patronymic => _patronymic;
  String get userName => _userName;
  String get userSurname => _userSurname;
  FormOfEducation get formOfEducation => _formOfEducation;
  String get status => _status;
  String get educationalLevel => _educationalLevel;
  String get phoneNumber => _phoneNumber;
  Group get group => _group;
  int get yearOfEntering => _yearOfEntering;
  DateTime get dateOfBirth => _dateOfBirth;
  String get providedEmail => _providedEmail;
  String get relativeSurname => _relativeSurname;
  String get relativeName => _relativeName;
  String get relativePatronymic => _relativePatronymic;
  String get relativePhoneNumber => _relativePhoneNumber;

  String formOfEducationStr() {
    switch (_formOfEducation) {
      case FormOfEducation.FeeBased:
        return 'Контракт';
      case FormOfEducation.StateFunded:
        return 'Бюджет';
    }
  }

  @override
  String toString() {
    return '''
    $_userName $_userSurname
    
    email: $email
    ПІБ студента: $_patronymic $_name $_surname
    
    ''';
  }
}