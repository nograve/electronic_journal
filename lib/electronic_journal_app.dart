import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home_page.dart';

class ElectronicJournalApp extends StatelessWidget {
  // const ElectronicJournalApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Since FirebaseApp is Future we need to resolve it
      // with FutureBuilder
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            // Implement error handling
              return const Text('Error');
            } else {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
