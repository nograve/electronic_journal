import 'package:electronic_journal/tabs/home_page_account_tab.dart';
import 'package:electronic_journal/tabs/home_page_main_tab.dart';
import 'package:electronic_journal/tabs/home_page_settings_tab.dart';
import 'package:electronic_journal/user_types/user_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(this._userType, this._onLogOut, {Key? key}) : super(key: key);

  final UserType _userType;
  final Function()? _onLogOut;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    print('TabIndex $_selectedTabIndex');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Електронний журнал'),
      ),
      body: _selectedTabIndex == 0 ? HomePageMainTab(widget._userType, widget._onLogOut) :
            _selectedTabIndex == 1 ? HomePageAccountTab(widget._userType) :
            _selectedTabIndex == 2 ? HomePageSettingsTab() :
            const Text('Помилка...'),
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
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
