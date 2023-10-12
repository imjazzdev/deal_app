import 'package:deal_app/pages/chatroom.dart';
import 'package:deal_app/pages/favorit.dart';
import 'package:deal_app/pages/home.dart';
import 'package:deal_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/utils.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _screen = [Home(), Favorit(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_selectedIndex],
        bottomNavigationBar: Container(
          height: 65,
          margin: EdgeInsets.only(left: 7, right: 7, bottom: 10),
          padding: EdgeInsets.only(left: 4, right: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.purple.shade100, width: 1.5),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(1, 1),
                    spreadRadius: 10,
                    color: Colors.purple.shade300.withOpacity(0.3))
              ],
              color: Colors.white),
          child: GNav(
              gap: 8,
              color: Colors.purple.shade400,
              padding: EdgeInsets.all(10),
              activeColor: Colors.white,
              tabBackgroundColor: Colors.purple.shade300,
              tabBorderRadius: 18,
              onTabChange: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.favorite_border, text: 'Favorit'),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ]),
        ));
  }
}
