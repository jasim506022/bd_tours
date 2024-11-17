import 'package:bd_tour_firebase/res/assets/animation_assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../data/response/app_exception.dart';
import '../repository/login_repository.dart';
import '../res/apps_function.dart';
import '../res/routes/routes_name.dart';
import 'loading_controller.dart';

class LoginController extends GetxController {
  // Why use final
  final _loginRepository = LoginRepository();

  final loadingController = Get.put(LoadingController());

  Future<void> performLoginAction(String email, String password) async {
    try {
      loadingController.setLoading(true);

      UserCredential userCredential = await _loginRepository
          .signInEmailandPasswordSnapshot(email: email, password: password);

    /*
      DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot =
          await _loginRepository.getUserDocumentById(
              uid: userCredential.user!.uid);

      bool checkEmailVerify = (userDocumentSnapshot.exists &&
              userDocumentSnapshot.data()?["status"] == "approved") ||
          userCredential.user!.emailVerified;


     */

      Get.offNamed(RoutesName.mainPage);
      AppsFunction.flutterToast(msg: "Sign in Successfully");
      /*
      if (checkEmailVerify) {
        Get.offNamed(RoutesName.mainPage);
        AppsFunction.flutterToast(msg: "Sign in Successfully");
      }

      else {
        loadingController.setLoading(false);
        AppsFunction.emailVerifyCheckAlert(
            userCredential: userCredential,
            animationAssets: "asset/lottie/unverified.json");
      }

       */

    } on FirebaseAuthExceptions catch (e) {
      loadingController.setLoading(false);
      AppsFunction.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: e.title!,
          content: e.message!,
          buttonText: "ok".tr);
    } catch (e) {
      loadingController.setLoading(false);
      AppsFunction.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: "Error Occur ",
          content: e.toString(),
          buttonText: "Ok".tr);
    } finally {
      loadingController.setLoading(false);
    }
  }

  Future<void> loginWithGmail() async {
    try {
      AppsFunction.errorDialog(
        barrierDismissible: false,
        animationAssets: AnimationAssets.noInternetAnimation,
        title: "Loading for sign with Gmail \n Pleasing Waiting........",
      );

      UserCredential? userCredentialGmail =
          await _loginRepository.signWithGoogle();

      if (userCredentialGmail != null) {
        bool userExist = await _loginRepository.userExists();
        if (userExist) {
          Get.back();
          Get.offNamed(RoutesName.mainPage);
          AppsFunction.flutterToast(msg: "Sign in Successfully");
        } else {
          Get.back();
          await _loginRepository.createUserGmail(userCredentialGmail.user!);

          Get.offNamed(RoutesName.mainPage);
          AppsFunction.flutterToast(msg: "Sign in Successfully");
        }
      }
    } on FirebaseAuthExceptions catch (e) {
      Get.back();
      AppsFunction.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: e.title!,
          content: e.message!,
          buttonText: "ok".tr);
    } catch (e) {
      Get.back();
      AppsFunction.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: "Error Occur ",
          content: e.toString(),
          buttonText: "Ok".tr);
    }
  }
}
