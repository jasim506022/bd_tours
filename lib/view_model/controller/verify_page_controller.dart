import 'dart:async';
import 'dart:ffi';

import 'package:bd_tour_firebase/repository/verifypagerepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class VerifyPageController extends GetxController {
  final VerifyPageRepository _verifyPageRepository = VerifyPageRepository();

  var isEmailVerified = false.obs;
  var canResendEmail = false.obs;

  late UserCredential _userCredential;

  late Timer _timer;

  @override
  void onInit() {
    // TODO: implement onInit
    _userCredential = Get.arguments as UserCredential;

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      _checkEmailVerification();
      if (isEmailVerified.value) {
        Get.offNamed(RoutesName.loginPage);
      }
    });

    if (FirebaseAuth.instance.currentUser != null) {
      isEmailVerified.value = _verifyPageRepository.currentUser!.emailVerified;
      if (!isEmailVerified.value) {
        sendVerificationEmail();
        _checkEmailVerification();
      }
    }

    update();
    super.onInit();
  }

  Future sendVerificationEmail() async {
    await _verifyPageRepository.sendVerificationEmail(_userCredential.user!);
    canResendEmail.value = false;
    await Future.delayed(const Duration(seconds: 3));
    canResendEmail.value = true;
  }

  Future _checkEmailVerification() async {
    await _verifyPageRepository.reloadUser();

    isEmailVerified.value = _verifyPageRepository.currentUser!.emailVerified;

    if (isEmailVerified.value) {
      await _verifyPageRepository.uploadUserData(_userCredential, true);
      _timer.cancel();

      Get.offNamed(RoutesName.loginPage);
    }
  }

  Future<void> cancel() async {
    await _verifyPageRepository.signOut();
    await _verifyPageRepository.uploadUserData(_userCredential, false);
    _timer.cancel();
    Get.offNamed(RoutesName.loginPage);
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
