import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';
import '../auth_methods.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this._onSignIn, {Key? key}) : super(key: key);

  final Function(UserType userType) _onSignIn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  UserType? _userType;
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // email, implement validator
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Електронна адреса',
            hintText: 'Введіть адрес електронної пошти',
          ),
          controller: _emailController,

        ),
        // password, implement validator
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Пароль',
            hintText: 'Введіть пароль від вашого аккаунта',
          ),
          obscureText: true,
          controller: _passwordController,
        ),
        // confirm button
        ElevatedButton(
          onPressed: () {
            signIn(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim())
                .then((user) {
              if (user != null) {
                _users.where('email', isEqualTo: _emailController.text)
                    .snapshots().listen((data) {
                      String userRole = data.docs.first['role'];
                      if (userRole == 'student') {
                        _userType = UserType.Student;
                      } else if (userRole == 'teacher') {
                        _userType = UserType.Teacher;
                      } else if (userRole == 'admin_representative') {
                        _userType = UserType.AdminRepresentative;
                      } else if (userRole == 'admin') {
                        _userType = UserType.Admin;
                      }
                      widget._onSignIn(_userType!);
                    });
              }
                });
            },
          child: Text('Увійти'),
        ),
      ],
    );
  }
}
