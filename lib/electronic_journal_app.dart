import 'package:electronic_journal/authentication_service.dart';
import 'package:electronic_journal/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElectronicJournalApp extends StatelessWidget {
  const ElectronicJournalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null
      ),
    ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

