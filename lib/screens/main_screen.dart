import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_app/screens/home_screen.dart';


import 'about_screen.dart';
import 'cpd_activity_welcome_sceen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentPage,
      children: [HomeScreen(), AboutScreen(), WelcomeSceen()],
    );
  }

  int _currentPage = 0;
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff34a0bc),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      currentIndex: _currentPage,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Help&Guide',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Services',
        ),
      ],
    );
  }
}
