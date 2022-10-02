// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:inhirited_app/calender_screen.dart';
import 'package:inhirited_app/contact_screen.dart';
import 'inbox_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        InboxScreen(),
        ContactScreen(),
        CalenderScreen(),
      ].elementAt(selected),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Inbox",
            icon: Icon(
              Icons.mail,
            ),
          ),
          BottomNavigationBarItem(
            label: "Contacts",
            icon: Icon(
              Icons.people,
            ),
          ),
          BottomNavigationBarItem(
            label: "Calender",
            icon: Icon(
              Icons.calendar_today,
            ),
          ),
        ],
      ),
    );
  }
}
