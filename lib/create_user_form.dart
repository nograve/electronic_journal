import 'package:flutter/material.dart';

class CreateUserForm extends StatefulWidget {
  const CreateUserForm({Key? key}) : super(key: key);

  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final _formKey = GlobalKey<FormState>();
  String _dropdownValue = 'Студент';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton(
            value: _dropdownValue,
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownValue = newValue!;
              });
            },
            items: <String>[
            'Студент',
            'Викладач',
            'Представник адміністрації',
            'Адміністратор',
          ]
              .map<DropdownMenuItem<String>>((String value)
    {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList()
          ),
          TextFormField(),
          TextFormField(),
          TextFormField(),

        ],
      ),
    );
  }
}
