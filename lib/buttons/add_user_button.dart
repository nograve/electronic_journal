import 'package:flutter/material.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => CreateUserPage()),
        // );
      },
      child: Column(
        children: const [
          Icon(Icons.add),
          Text('Додати користувача'),
        ],
      ),
    );
  }
}
