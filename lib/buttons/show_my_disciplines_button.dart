import 'package:flutter/material.dart';

class ShowMyDisciplinesButton extends StatelessWidget {
  const ShowMyDisciplinesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Column(
        children: const [
          Icon(Icons.book),
          Text('Мої предмети'),
        ],
      ),
    );
  }
}
