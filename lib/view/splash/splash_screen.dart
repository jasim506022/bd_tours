



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/splash_controller.dart';
import '../../res/app_colors.dart';
import 'widget/project_logo_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var splashController = Get.find<SplashController>();
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Material(
      color: AppColors.white,
      child: AnimatedAlign(
        alignment: splashController. selected.value ? Alignment.center : Alignment.bottomCenter,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child:
             SizedBox(height: 120.h, width: 160.w, child: ProjectLogoWidget()),
      ),
    );
  }
}
