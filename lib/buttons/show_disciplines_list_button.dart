import 'package:flutter/material.dart';

class ShowDisciplinesListButton extends StatelessWidget {
  const ShowDisciplinesListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Column(
          children: [
            Icon(Icons.list),
            Text('Список дисциплін'),
          ],
        )
    );
  }
}
