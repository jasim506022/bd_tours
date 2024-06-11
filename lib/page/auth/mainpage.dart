import 'package:bd_tour_firebase/const/gobalcolor.dart';
import 'package:bd_tour_firebase/page/auth/loginpage.dart';
import 'package:bd_tour_firebase/page/home/homepage.dart';
import 'package:bd_tour_firebase/work/data/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  List<Widget> list = [HomePage(), SearchPage(), Text("Whllo"), Text("Whllo")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.easeInOut,
        backgroundColor: Colors.white,
        selectedColorOpacity: 0.0,
        selectedItemColor: AppColors.blueColor,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(IconlyLight.home),
            title: const Text("Home"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
            // selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            // selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            // selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        ListTile(
          title: Text("Hello BAngladeshb"),
          subtitle: Text("What are you doing now"),
          onTap: () {
            Get.defaultDialog(
              title: ("Hi Bangladesh"),
              content: Text("Every Thing is okay ")
            );
          },
        )
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetException("Hello");
        },
      ),
    );
  }
}
