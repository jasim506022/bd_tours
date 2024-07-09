import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../data/network/data_firebase_service.dart';
import '../model/profile_model.dart';

class ProfileRepository {
  final _dataFirebaseService = DataFirebaseService();

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserDocumentSnapshot() {
    return _dataFirebaseService.getCurrentUserDocumentSnapshot();
  }

  Future<String> imageUploadedUrl({required String path}) async {
    return _dataFirebaseService.imageUploadedUrl(path: path);
  }

  Future<XFile?> captureImageFrom({required ImageSource imageSource}) async {
    final ImagePicker picker = ImagePicker();
    return picker.pickImage(source: imageSource);
  }

  Future<void> uploadEditProfileSnapshot(
      {required ProfileModel profileModel}) async {
    _dataFirebaseService.uploadEditProfileSnapshot(profileModel: profileModel);
  }
}
