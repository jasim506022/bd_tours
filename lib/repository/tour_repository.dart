import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';
import '../data/response/app_exception.dart';

class TourRepository {
  final DataFirebaseService _dataFirebaseService = DataFirebaseService();

  /// Retrieves a stream of tour snapshots based on the specified category.
  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required String category}) {
    return _getTourSnapshot(
        () => _dataFirebaseService.tourSnapshot(category: category));
  }

  /// Retrieves a stream of popular tour snapshots based on the specified category.
  Stream<QuerySnapshot<Map<String, dynamic>>> popularTourSnapshot(
      {required String category}) {
    return _getTourSnapshot(
        () => _dataFirebaseService.popularTourSnapshot(category: category));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String tourId}) {
    return _dataFirebaseService.singleTourSnapshot(tourId: tourId);
  }

  Future<void> updateTourSnapshot(
      {required num rating,
      required int totalReviews,
      required String tourId}) async {
    _dataFirebaseService.updateTourSnapshot(
        rating: rating, totalReviews: totalReviews, tourId: tourId);
  }

  /// Helper method to handle snapshot retrieval with error handling.
  Stream<QuerySnapshot<Map<String, dynamic>>> _getTourSnapshot(
      Stream<QuerySnapshot<Map<String, dynamic>>> Function() snapshotProvider) {
    try {
      return snapshotProvider();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }
}

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../data/network/data_firebase_service.dart';
// import '../data/response/app_exception.dart';
//
// class TourRepository {
//   final _dataFirebaseService = DataFirebaseService();
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot({required String category}) {
//     try {
//       return _dataFirebaseService.tourSnapshot(category: category);
//     } on FirebaseAuthException catch (e) {
//       throw FirebaseAuthExceptions(e);
//     } on SocketException catch (e) {
//       throw InternetException(e.toString());
//     } catch (e) {
//       throw OthersException(e.toString());
//     }
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> popularTourSnapshot({required String category}) {
//     try {
//       return _dataFirebaseService.popularTourSnapshot(category: category);
//     } on FirebaseAuthException catch (e) {
//       throw FirebaseAuthExceptions(e);
//     } on SocketException catch (e) {
//       throw InternetException(e.toString());
//     } catch (e) {
//       throw OthersException(e.toString());
//     }
//   }
// }
