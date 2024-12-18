import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/Home/homeScreen.dart';
import '../../features/Home/settingScreen.dart';
import '../../features/Profile/profile.dart';

class ButtonNavigation extends StatefulWidget {
  final int initialPage;

  const ButtonNavigation({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  late int _page; // Variable to track the selected tab
  bool _isAuthenticated = true; // Initialize _isAuthenticated with true

  // Create Navigator keys for each tab
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> pages = [
    Homescreen(),
    SettingScreen(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage; // Initialize with the provided initialPage
  }

  void _selectPage(int index) {
    setState(() {
      _navigatorKeys[_page].currentState?.popUntil((route) => route.isFirst);
      _page = index;
    });
  }

  // Function to update authentication state
  void _updateAuthState(bool isAuthenticated) {
    setState(() {
      _isAuthenticated = isAuthenticated;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      // If user is not authenticated, return a widget that doesn't show the tab bar
      return Scaffold(
        body: pages[_page], // Show only the page without the tab bar
      );
    }

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.green,
        activeColor: Colors.white,
        inactiveColor: Colors.grey.shade600,
        currentIndex: _page,
        onTap: (index) => _selectPage(index),
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
