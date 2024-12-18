import 'package:flightbooking/features/Home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'bottom_nav_controller.dart';

class BottonNavBar extends StatelessWidget {
  const BottonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (controller) {
          return Scaffold(
            body: controller.selectScreen,
            bottomNavigationBar: GNav(
                haptic: true,
                tabBorderRadius: 15,
                selectedIndex: controller.selectScreenIndex ?? 0,
                curve: Curves.easeOutExpo,
                onTabChange: (t) => controller.onButtonTap(t),
                duration: const Duration(milliseconds: 50),
                gap: 8,
                color: Colors.grey[800],
                activeColor: Colors.purple,
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.purple.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Search',
                  ),
                ]).paddingOnly(bottom: 20, left: 40, right: 40, top: 10),
          );
        });
  }
}
