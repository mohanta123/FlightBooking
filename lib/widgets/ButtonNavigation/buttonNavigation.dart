import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/Home/homeScreen.dart';
import '../../features/Profile/profile.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _page = 0; // Variable to track the selected tab

  final List<Widget> pages = [
    Homescreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.green,
        activeColor: Colors.white,
        inactiveColor: Colors.grey.shade600,
        currentIndex: _page,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) => pages[_page],
        );
      },
    );
  }
}
