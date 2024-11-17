import 'package:get/get.dart';

import '../const/const.dart';

class SelectGenderController extends GetxController {
  final Rx<Gender> selectGender = Gender.male.obs;

  setGender(Gender gender) {
    selectGender.value = gender;
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.male:
        return "male".tr;
      case Gender.female:
        return "female".tr;
      case Gender.other:
        return "other".tr;
    }
  }

  Gender? stringToGender(String gender) {
    switch (gender) {
      case "male":
        return Gender.male;
      case "female":
        return Gender.female;
      case "other":
        return Gender.other;
    }
    return null;
  }
}
