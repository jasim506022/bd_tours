import 'package:get/get.dart';

import '../../const/const.dart';
import '../../data/response/app_exception.dart';
import '../../model/profile_model.dart';
import '../../repository/registration_repository.dart';
import '../../res/assets/animation_assets.dart';
import '../../res/routes/routes_name.dart';
import 'loading_controller.dart';

class RegistrationController extends GetxController {
  final loadingController = Get.put(LoadingController());
  final _registrationRepository = RegistrationRepository();

  Future<void> createUserWithEmilandPasswordSnaphsot(
      {required String email,
      required String password,
      required ProfileModel profileModel}) async {
    try {

      loadingController.setLoading(true);

      var userCredential =
          await _registrationRepository.createUserWithEmilandPasswordSnaphsot(
              email: email, password: password);
      if (userCredential != null) {
        profileModel.uid = userCredential.user!.uid;
        _registrationRepository.uploadUserInformationFirebaseDatabase(
            profileModel: profileModel);
        loadingController.setLoading(false);
        print(userCredential);
        // Get.offNamed(RoutesName.userVerifyPage, arguments: userCredential);
        Get.offAll(RoutesName.loginPage);
        globalMethod.flutterToast(msg: "Sign in Successfully");
      }
    } on FirebaseAuthExceptions catch (e) {
      loadingController.setLoading(false);
      globalMethod.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: e.title!,
          content: e.message!,
          buttonText: "ok".tr);
    } catch (e) {
      loadingController.setLoading(false);
      globalMethod.errorDialog(
          animationAssets: AnimationAssets.nosErrorAnimation,
          title: "Error Occur ",
          content: e.toString(),
          buttonText: "Ok".tr);
    } finally {
      loadingController.setLoading(false);
    }
  }
}
