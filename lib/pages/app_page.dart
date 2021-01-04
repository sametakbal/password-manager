import 'package:flutter/material.dart';

import 'package:password_manager/pages/generate_page.dart';
import 'package:password_manager/pages/settings_page.dart';
import 'package:password_manager/pages/storage_page.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;

  TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Roboto');

  List<Widget> _widgetOptions = <Widget>[
    StoragePage(),
    GeneratePage(),
    SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.search,
              color: Color(0xff011ED8),
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_outline_rounded,
              ),
              label: 'Storage'),
          BottomNavigationBarItem(icon: Icon(Icons.replay), label: 'Generate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        elevation: 20.0,
        iconSize: 35.0,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff011ED8),
        unselectedItemColor: Color(0xffb1cefe),
        selectedFontSize: 16.0,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
      ),
    );
  }
}
