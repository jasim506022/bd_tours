import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../data/network/data_firebase_service.dart';
import '../model/review_model.dart';

class ReviewRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  Future<List<XFile?>> captureImageFrom([ImageSource? imageSource]) async {
    final ImagePicker picker = ImagePicker();
    List<XFile?> xFile = [];
    if (imageSource != null) {
      var image = await picker.pickImage(source: imageSource);
      if (image != null) {
        xFile.add(image);
      }
      return xFile;
    } else {
      var imageList = await picker.pickMultiImage();
      if (imageList.isNotEmpty) {
        xFile.addAll(imageList);
      }
      return xFile;
    }
  }

  Future<List<String>> uploadImageStorage(
      {required List<XFile> imageList, required String folderName}) async {
    return _dataFirebaseService.uploadImageStorage(
        imageList: imageList, folderName: folderName);
  }

  Future<void> postReviewed(
      {required String tourId, required ReviewModel reviewModel}) async {
    _dataFirebaseService.postReviewed(tourId: tourId, reviewModel: reviewModel);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> reviewSnapshot(
      {required String tourId}) {
    return _dataFirebaseService.reviewSnapshot(tourId: tourId);
  }
}
