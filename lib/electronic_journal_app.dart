import 'package:electronic_journal/pages/auth_page.dart';
import 'package:electronic_journal/pages/home_page.dart';
import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';

UserType? userType;
bool isSignedIn = false;

class ElectronicJournalApp extends StatefulWidget {
  const ElectronicJournalApp({Key? key}) : super(key: key);

  @override
  _ElectronicJournalAppState createState() => _ElectronicJournalAppState();
}

class _ElectronicJournalAppState extends State<ElectronicJournalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // if Signed In - use Home Page, if not - Auth Page
      home: isSignedIn ? HomePage() : AuthPage(),
    );
  }
}
