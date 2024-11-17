import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/tour_model.dart';
import '../repository/tour_repository.dart';
import 'category_controller.dart';
import 'location_controller.dart';

class TourController extends GetxController {
  TourRepository repository;

  TourController({required this.repository});

  final categoryController = Get.find<CategoryController>();

  var locationController = Get.find<LocationController>();

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot([String? category]) {
    try {
      return repository.tourSnapshot(
          category: category ?? categoryController.currentCategory.value);
    } catch (e) {
      throw const Text("Bangladesh");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> popularTourSnapshot() {
    try {
      return repository.popularTourSnapshot(
          category: categoryController.currentCategory.value);
    } catch (e) {
      throw const Text("Bangladesh");
    }
  }

  List<TourModel> filteredDocs(List<QueryDocumentSnapshot<Object?>> snapshot) {
    try {
      String currentAddress = locationController.currentLocation.value
          .split(",")
          .firstWhere((element) => element.isNotEmpty, orElse: () => "Dhaka");

      if (currentAddress == "ঢাকা") {
        currentAddress = "Dhaka";
      }

      return snapshot
          .where((doc) {
            var address = doc['address'] as String;
            return address.contains(currentAddress);
          })
          .map((doc) => TourModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw const Text("Bangladesh");
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String tourId}) {
    return repository.singleTourSnapshot(tourId: tourId);
  }

  Future<void> updateTourSnapshot(
      {required num rating,
      required int totalReviews,
      required String tourId}) async {
    repository.updateTourSnapshot(
        rating: rating, totalReviews: totalReviews, tourId: tourId);
  }
}
