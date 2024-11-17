import 'package:bd_tour_firebase/res/assets/animation_assets.dart';
import 'package:bd_tour_firebase/res/routes/string_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/profile_model.dart';
import '../../repository/profile_repository.dart';
import '../res/apps_function.dart';
import '../res/constant.dart';
import '../widget/error_dialog_widget.dart';
import '../work/data/app_exception.dart';
import 'SelectGenderController.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;

  var profileModel = Rx<ProfileModel>(ProfileModel());

  var imageFile = Rx<XFile?>(null);

  ProfileController({required this.repository});

  RxList<DateTime?> dateValue =
      <DateTime?>[DateTime.now().add(const Duration(days: 1))].obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final selectGenderController = Get.put(SelectGenderController());

  late Future<DocumentSnapshot<Map<String, dynamic>>> snapshot;

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserDocumentSnapshot() async {
    return await repository.getCurrentUserDocumentSnapshot();
  }

  updateDAtaFromFirebase(AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
    profileModel.value =
        ProfileModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
    nameController.text = profileModel.value.name!;
    phoneController.text = profileModel.value.phone!;
    emailController.text = profileModel.value.email!;
    addressController.text = profileModel.value.address!;
    selectGenderController.stringToGender(profileModel.value.gender!);
    dateValue[0] = profileModel.value.dateOfBirth!.toDate();
  }

  caputreImageFormGaller() async {
    imageFile.value =
        await repository.captureImageFrom(imageSource: ImageSource.camera);
  }

  uploadUserDocument() async {
    if (imageFile.value != null) {
      var imageUrl =
          await repository.imageUploadedUrl(path: imageFile.value!.path);

      profileModel.value = ProfileModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          address: addressController.text,
          image: imageUrl,
          name: nameController.text,
          email: emailController.text,
          gender: selectGenderController.selectGender.value.name,
          phone: phoneController.text,
          dateOfBirth: Timestamp.fromMillisecondsSinceEpoch(
              dateValue[0]!.millisecondsSinceEpoch));
    } else {
      profileModel.value = ProfileModel(
        dateOfBirth: Timestamp.fromMillisecondsSinceEpoch(
            dateValue[0]!.millisecondsSinceEpoch),
        address: addressController.text,
        image: profileModel.value.image,
        name: nameController.text,
        email: emailController.text,
        gender: selectGenderController.selectGender.value.name,
        phone: phoneController.text,
      );
    }

    repository.uploadEditProfileSnapshot(profileModel: profileModel.value);
  }

  Future<void> getUserInformationSnapshot() async {
    try {
      var snapshot = await repository.getCurrentUserDocumentSnapshot();

      if (!snapshot.exists) {
        AppsFunction.flutterToast(msg: "User Doesn't Exist");
        return;
      }

      profileModel.value = ProfileModel.fromMap(snapshot.data()!);
      if (profileModel.value.status == AppsString.approved) {
        _saveUserInformationToPreferences();
      }
    } catch (e) {
      if (e is AppException) {
        Get.dialog(ErrorDialogWidget(
          title: e.title,
          animationAssets: AnimationAssets.noErrorAnimation,
          content: e.message,
          buttonText: AppsString.okay,
        ));
      }
    }
  }

  Future<void> _saveUserInformationToPreferences() async {
    var profile = profileModel.value;
    final prefsTasks = [
      sharedPreference!.setString(AppsString.uidPreferences, profile.uid!),
      sharedPreference!.setString(AppsString.emailPreferences, profile.email!),
      sharedPreference!.setString(AppsString.namePreferences, profile.name!),
      sharedPreference!.setString(AppsString.imagePreferences, profile.image!),
      sharedPreference!.setString(AppsString.phonePreferences, profile.phone!),
    ];
    await Future.wait(prefsTasks);
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
