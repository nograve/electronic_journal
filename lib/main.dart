import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'electronic_journal_app.dart';

Future<void> main() async {
  // Ensure widgets binding for Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ElectronicJournalApp());
}
