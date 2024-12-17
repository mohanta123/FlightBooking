import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/Home/homeScreen.dart';
import '../../features/Home/settingScreen.dart';
import '../../features/Profile/profile.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _page = 0; // Variable to track the selected tab

  // Create Navigator keys for each tab
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> pages = [
    Homescreen(),
    SettingScreen(),
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
            // Reset the navigation stack of the previous tab
            _navigatorKeys[_page].currentState?.popUntil((route) => route.isFirst);
            _page = index; // Update the selected tab
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          navigatorKey: _navigatorKeys[index],
          builder: (context) => pages[index],
        );
      },
    );
  }
}
