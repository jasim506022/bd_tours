import 'package:bd_tour_firebase/work/data/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppException implements Exception {
   String? message;
   String? title;

  AppException([this.message, this.title]);

  @override
  String toString() {
    return 'AppException: message: $message, details: $title';
  }
}

class InternetException extends AppException {
  InternetException(String? message) : super(message!, "no_internet_exception".tr);
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'request_time_out'.tr);
}

class FirebaseAuthExceptions extends AppException {
  final FirebaseAuthException exception;

  FirebaseAuthExceptions(this.exception) : super() {
    _setMessageAndDetails();
  }

  void _setMessageAndDetails() {
    switch (exception.code) {
      case 'email-already-in-use':
        message = 'email-already-in-use'.tr;
        title = 'email-already-in-use-title'.tr;
        break;
      case 'wrong-password':
        message = 'wrong-password'.tr;
        title = 'wrong-password-title'.tr;
        break;
      case 'invalid-email':
        message = 'invalid-email'.tr;
        title = 'invalid-email-title'.tr;
        break;
      case 'invalid-credential':
        message = 'invalid-credential'.tr;
        title = 'invalid-credential-title'.tr;
        break;
      case 'weak-password':
        message = 'weak-password'.tr;
        title = 'weak-password-title'.tr;
        break;
      case 'too-many-requests':
        message = 'too-many-requests'.tr;
        title = 'too-many-requests-title'.tr;
        break;
      case 'operation-not-allowed':
        message = 'operation-not-allowed'.tr;
        title = 'operation-not-allowed-title'.tr;
        break;
      case 'user-disabled':
        message = 'user-disabled'.tr;
        title = 'user-disabled-title'.tr;
        break;
      case 'user-not-found':
        message = 'user-not-found'.tr;
        title = 'user-not-found-title'.tr;
        break;
      default:
        message = 'default-message'.tr;
        title = 'default-title'.tr;
        break;
    }
  }
}

class OthersException extends AppException {
  OthersException([String? message]) : super(message, 'other_exception'.tr);
}