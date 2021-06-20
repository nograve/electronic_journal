import 'package:flutter/material.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [
          Icon(Icons.add),
          Text('Додати користувача'),
        ],
      ),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => CreateUserPage()),
        // );
      },
    );
  }
}
