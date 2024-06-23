import 'package:flutter/material.dart';
import 'package:tubes/pages/editprofile/editprofile.dart';
import 'package:tubes/pages/heartcheck/heartcheck.dart';
import 'package:tubes/pages/home/homescreen.dart';
import 'package:tubes/styles/colors.dart';
import 'package:tubes/styles/fonts.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);
  static const nameRoute = '/main';

  @override
  State<NavigationMenu> createState() => _MainPageState();
}

class _MainPageState extends State<NavigationMenu> {
  int _selectedIndex = 1;

  static List<Widget> pages = [
    HeartCheck(),
    HomeScreen(),
    EditProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: _customBottomNav(),
    );
  }

  Widget _customBottomNav() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              15,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: txtshadowheart,
              blurRadius: 10,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            15,
          ),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedLabelStyle: txtshadow,
            unselectedLabelStyle: txtshadow,
            selectedItemColor: bgColor1,
            unselectedItemColor: txtshadowlogin,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/tambah.png',
                    width: 24,
                    color: _selectedIndex == 0 ? bgColor1 : txtshadowlogin,
                  ),
                  label: 'Heart Check'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    width: 24,
                    color: _selectedIndex == 1 ? bgColor1 : txtshadowlogin,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    width: 24,
                    color: _selectedIndex == 2 ? bgColor1 : txtshadowlogin,
                  ),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
