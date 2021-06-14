import 'package:electronic_journal/auth_methods.dart';
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
      print('TabIndex $_selectedIndex');
    });
  }

  void onLogOut() {
    logOut().then((user) {
      if (user == null) {
        setState(() {
          _isSignedIn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Firebase initialized with FutureBuilder
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
              body: _selectedIndex == 0 ? Column(
                children: [
                  // Logout button
                  ElevatedButton(
                      onPressed: onLogOut,
                      child: Text('Вийти'),
                  ),
                ],
              ) : _selectedIndex == 1 ? Column(

              ) : Column(

              ),
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
                  // email, implement validator
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Електронна адреса',
                      hintText: 'Введіть адрес електронної пошти',
                    ),
                    controller: emailController,

                  ),
                  // password, implement validator
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Пароль',
                      hintText: 'Введіть пароль від вашого аккаунта',
                    ),
                    obscureText: true,
                    controller: passwordController,
                  ),
                  // confirm button
                  ElevatedButton(
                    onPressed: () {
                      signIn(email: emailController.text, password: passwordController.text)
                          .then((user) {
                         if (user != null) {
                           setState(() {
                             _isSignedIn = true;
                           });
                         }
                      });
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



