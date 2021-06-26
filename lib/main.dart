import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'electronic_journal_app.dart';

Future<void> main() async {
  // Ensure widgets binding for Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Connecting to Firebase
  await Firebase.initializeApp();

  runApp(const ElectronicJournalApp());
}
