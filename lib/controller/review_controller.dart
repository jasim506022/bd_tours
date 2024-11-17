import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/review_model.dart';
import '../model/tour_model.dart';
import '../repository/review_repository.dart';
import '../res/constant.dart';
import '../res/routes/string_constant.dart';
import 'loading_controller.dart';
import 'tour_controller.dart';

class ReviewController extends GetxController {
  // Observed variables for dynamic data updates
  var inputRatting = 0.0.obs;
  var imageXFFleList = <XFile?>[].obs;

  TextEditingController textEditingController = TextEditingController();

  // Dependency injections
  ReviewRepository repository;
  var tourController = Get.find<TourController>();
  LoadingController loadingController = Get.put(LoadingController());

  ReviewController({required this.repository});

  Future<void> captureImage([ImageSource? imageSource]) async {
    try {
      List<XFile?> selectImage = [];
      if (imageSource == null) {
        selectImage = await repository.captureImageFrom();
      } else {
        selectImage = await repository.captureImageFrom(imageSource);
      }
      imageXFFleList.addAll(selectImage);
    } catch (e) {
      if (kDebugMode) {
        print("Error capturing image: $e");
      }
    }
  }

  void deleteImage(int index) {
    try {
      imageXFFleList.removeAt(index);
    } catch (e) {
      if (kDebugMode) {
        print("Error deleting image at index $index: $e");
      }
    }
  }

  Future<List<String>> uploadImageStorage({required String folderName}) async {
    try {
      List<XFile> nonNullImageList =
          imageXFFleList.where((file) => file != null).cast<XFile>().toList();
      return repository.uploadImageStorage(
          imageList: nonNullImageList, folderName: folderName);
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading images to storage: $e");
      }
      return [];
    }
  }

  Future<void> uploadReviewed({required TourModel tourModel}) async {
    try {
      loadingController.setLoading(true);
      List<String> imageList = [];
      if (imageXFFleList.isNotEmpty) {
        imageList = await uploadImageStorage(folderName: tourModel.name!);
      }

      num newAverageRating = _calculateNewAverageRating(
        tourModel.ratting!,
        tourModel.totalreview!,
        inputRatting.value,
      );

      var reviewId = DateTime.now().millisecondsSinceEpoch.toString();
      ReviewModel reviewModel = ReviewModel(
          image: sharedPreference!.getString(AppsString.imagePreferences),
          name: sharedPreference!.getString(AppsString.namePreferences),
          timeDate: reviewId,
          rating: inputRatting.value,
          reviewId: reviewId,
          commentImage: imageList,
          description: textEditingController.text);

      repository.postReviewed(tourId: tourModel.id!, reviewModel: reviewModel);

      tourController.updateTourSnapshot(
          rating: newAverageRating,
          totalReviews: tourModel.totalreview! + 1,
          tourId: tourModel.id!);

      imageXFFleList.value = [];
      textEditingController.clear();
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading review: $e");
      }
    } finally {
      loadingController.setLoading(false);
    }
  }
}

num _calculateNewAverageRating(
    num currentRating, num totalReview, double newRating) {
  var currentTotalRating = currentRating * totalReview;
  var updatedTotalRating = currentTotalRating + newRating;
  return updatedTotalRating / (totalReview + 1);
}
