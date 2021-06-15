import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_journal/auth_methods.dart';
import 'package:electronic_journal/user_type.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ElectronicJournalApp extends StatefulWidget {
  const ElectronicJournalApp({Key? key}) : super(key: key);

  @override
  _ElectronicJournalAppState createState() => _ElectronicJournalAppState();
}

class _ElectronicJournalAppState extends State<ElectronicJournalApp> {
  final Future<FirebaseApp> _fbInit = Firebase.initializeApp();

  // CollectionReferences to reference db from Firestore
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  final CollectionReference _degrees = FirebaseFirestore.instance.collection('degrees');
  final CollectionReference _statuses = FirebaseFirestore.instance.collection('statuses');

  UserType? _userType;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isSignedIn = false;
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
                      child: Column(
                        children: [
                          Icon(Icons.login),
                          Text('Вийти'),
                        ],
                      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim())
                          .then((user) {
                        if (user != null) {
                          setState(() {
                            _isSignedIn = true;
                          });
                          _users.where('email', isEqualTo: emailController.text)
                              .snapshots().listen((data) {
                            String userRole = data.docs.first['role'];
                            if (userRole == 'student') {
                              _userType = UserType.Student;
                            } else if (userRole == 'teacher') {
                              _userType = UserType.Teacher;
                            } else if (userRole == 'admin_representative') {
                              _userType = UserType.AdminRepresentative;
                            } else if (userRole == 'admin') {
                              _userType = UserType.Admin;
                            }
                            print('user role is $userRole');
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
          return CircularProgressIndicator();
        }
      },
    );
  }
}



