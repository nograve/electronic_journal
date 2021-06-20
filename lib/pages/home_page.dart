import 'package:electronic_journal/tabs/home_page_account_tab.dart';
import 'package:electronic_journal/tabs/home_page_main_tab.dart';
import 'package:electronic_journal/tabs/home_page_settings_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: _selectedTabIndex == 0 ? HomePageMainTab() :
            _selectedTabIndex == 1 ? HomePageAccountTab() :
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
