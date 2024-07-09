import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/const.dart';
import '../../model/profile_model.dart';
import '../../repository/profile_repository.dart';
import 'SelectGenderController.dart';

class ProfileController extends GetxController {

  // var isEdit = false.obs;

  final _profileRepository = ProfileRepository();

  var profileModel = Rx<ProfileModel>(ProfileModel());

  var imageFile = Rx<XFile?>(null);

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
    return await _profileRepository.getCurrentUserDocumentSnapshot();
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
    imageFile.value = await _profileRepository.captureImageFrom(
        imageSource: ImageSource.gallery);
  }

  uploadUserDocument() async {
    if (imageFile.value != null) {
      var imageUrl = await _profileRepository.imageUploadedUrl(
          path: imageFile.value!.path);

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

    _profileRepository.uploadEditProfileSnapshot(
        profileModel: profileModel.value);
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
