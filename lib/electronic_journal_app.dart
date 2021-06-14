import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ElectronicJournalApp extends StatefulWidget {
  const ElectronicJournalApp({Key? key}) : super(key: key);

  @override
  _ElectronicJournalAppState createState() => _ElectronicJournalAppState();
}

class _ElectronicJournalAppState extends State<ElectronicJournalApp> {
  final Future<FirebaseApp> _fbInit = Firebase.initializeApp();
  bool _isSignedIn = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fbInit,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            // if Signed In - use Home Page
            home: _isSignedIn ? Scaffold(
              appBar: AppBar(
                title: const Text('Електронний журнал'),
              ),
              // Write body here
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Головна',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined),
                    label: 'Профіль',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Налаштування',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            )
                :
                // if Not Signed In - use Authentication Page
            Scaffold(
              body: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Почта',
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Увійти'),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Сталася помилка...');
        } else {
          return Text('Загружую...');
        }
      },
    );
  }
}



