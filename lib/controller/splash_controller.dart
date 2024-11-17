import 'dart:async';

import 'package:get/get.dart';

import '../repository/splash_repository.dart';
import '../res/routes/routes_name.dart';

class SplashController extends GetxController {
  var selected = false.obs;
  SplashRepository repository;

  SplashController({required this.repository});

  @override
  void onInit() {
    Timer(const Duration(seconds: 1), () {
      selected.value = true;
    });
    Timer(
      const Duration(seconds: 3),
      () {
        var user = repository.currentUser();
        if (user != null) {
          Get.offAllNamed(RoutesName.mainPage);
        } else {
          Get.offNamed(RoutesName.loginPage);
        }
      },
    );
    super.onInit();
  }
}
