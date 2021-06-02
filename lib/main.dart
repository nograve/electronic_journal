import 'package:flutter/material.dart';

import 'electronic_journal_app.dart';

Future<void> main() async {
  // Ensure widgets binding for Firebase
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ElectronicJournalApp());
}
