import 'package:flightbooking/features/Home/homeScreen.dart';
import 'package:flightbooking/features/Home/settingScreen.dart';
import 'package:flightbooking/features/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/Bookings/bookings.dart';

class BottomNavController extends GetxController {
  List<Icon> icons = [
    const Icon(Icons.home),
    const Icon(Icons.settings),
    const Icon(Icons.person)
  ];
  List<Widget>? screens;
  Widget? selectScreen;
  int? selectScreenIndex;

  bool isSearch = false;
  @override
  void onInit() {
    super.onInit();
    screens = [
      isSearch ? const Bookings() : Homescreen(),
      SettingScreen(),
      const Profile()
    ];
    selectScreen = screens?.first;
  }

  onButtonTap(int index) {
    selectScreenIndex = index;
    selectScreen = screens![index];
    update();
  }
}
