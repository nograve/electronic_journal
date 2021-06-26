import 'package:electronic_journal/forms/create_user_form.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateUserForm(),
    );
  }
}
