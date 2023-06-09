import 'package:alquran_new/shared/theme.dart';
import 'package:alquran_new/ui/pages/bottom_nav/bookmark_page.dart';
import 'package:alquran_new/ui/pages/bottom_nav/doa_page.dart';
import 'package:alquran_new/ui/pages/bottom_nav/doa_solat.dart';
import 'package:alquran_new/ui/pages/bottom_nav/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List indexWidget = [
    const HomePage(),
    const DoaPage(),
    const DoaSolatPage(),
    const BookmarkPage(),
  ];

  BottomNavigationBarItem bottomNavbarItem(String icon, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        color: greyColor,
        width: 70,
        height: 70,
      ),
      activeIcon: Image.asset(
        icon,
        color: indicatorColor,
        width: 70,
        height: 70,
      ),
      label: label,
    );
  }

  void setTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget bottomNavBar(int index) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      backgroundColor: bottomNavbarColor,
      showUnselectedLabels: false,
      onTap: setTapped,
      items: [
        bottomNavbarItem('assets/buttom_navbar1.png', 'Quran'),
        bottomNavbarItem('assets/buttom_navbar4.png', 'Doa'),
        bottomNavbarItem('assets/buttom_navbar3.png', 'Doa Solat'),
        bottomNavbarItem('assets/buttom_navbar5.png', 'Bookmark'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexWidget.elementAt(selectedIndex),
      bottomNavigationBar: bottomNavBar(selectedIndex),
    );
  }
}
