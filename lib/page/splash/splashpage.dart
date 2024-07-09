import 'dart:async';

import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widget/projecticonwidget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    // Start a timer to toggle the selected state every 1 seconds

    Timer(const Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });
    Timer(
      const Duration(seconds: 3),
      () {
        // Navigate to the login page after 3 seconds
        // Navigator.pushReplacementNamed(context, AppRouters.loginPage);
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        var user = firebaseAuth.currentUser;
        if (user != null) {
          Get.offAllNamed(RoutesName.mainPage);
        } else {
          Get.offNamed(RoutesName.loginPage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Material(
      color: Colors.white,
      child: AnimatedAlign(
        alignment: selected ? Alignment.center : Alignment.bottomCenter,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child:
            const SizedBox(height: 120, width: 160, child: ProjectIconWidget()),
      ),
    );
  }
}
