import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowStudentsButton extends StatelessWidget {
  ShowStudentsButton({Key? key}) : super(key: key);

  final CollectionReference _students = FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [
          Icon(Icons.account_box),
          Text('Список студентів'),
        ],
      ),
      onPressed: () {
        // create page for showing students list
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Expanded(
            child: StreamBuilder(
              stream: _students.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data!.docs.map((e) => ListTile(title: Text(e.toString()),)).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        }),
        );
      },
    );
  }
}
