
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../controller/profile_controller.dart';
import '../../res/app_colors.dart';
import '../home/home_page.dart';
import '../home/search_page.dart';
import '../profile/settings_screen.dart';
import '../tour_details/tours_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var profileController = Get.find<ProfileController>();

  var _currentIndex = 0;

  List<Widget> page = [
    const HomePage(),
    const ToursPage(),
    const SearchPage(),
    const Text("who"),
    const SettingsScreen()
  ];

  @override
  void initState() {
    super.initState();
    profileController.getUserInformationSnapshot();
    _initializeIndex();
  }

  void _initializeIndex() {
    int? data = Get.arguments;
    if (data != null) {
      setState(() => _currentIndex = data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.easeInOut,
        backgroundColor: Colors.white,
        selectedColorOpacity: 0.0,
        selectedItemColor: AppColors.blueColor,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: _bottomBarItems(),
      ),
    );
  }

  List<SalomonBottomBarItem> _bottomBarItems() {
    return [
      SalomonBottomBarItem(
        icon: const Icon(IconlyLight.home),
        title: const Text("Home"),
        activeIcon: const Icon(IconlyBold.home),
      ),

      /// Tours
      SalomonBottomBarItem(
        icon: const Icon(Icons.list),
        title: const Text("Tours"),
        activeIcon: const Icon(Icons.list),
      ),

      /// Likes
      SalomonBottomBarItem(

        icon: const Icon(Icons.favorite_border),
        title: const Text("Likes"),
        activeIcon: const Icon(Icons.favorite),
      ),

      /// Search
      SalomonBottomBarItem(
        icon: const Icon(Icons.search),
        title: const Text("Search"),
        activeIcon: const Icon(Icons.search),
        // selectedColor: Colors.orange,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: const Icon(Icons.person),
        title: const Text("Profile"),
        activeIcon: const Icon(Icons.person),
      ),
    ];
  }
}
