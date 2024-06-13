import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';

class VerifyPageRepository {
  final _dataFirebaseService = DataFirebaseService();

  Future<void> sendVerificationEmail(User user) async {
    await _dataFirebaseService.sendVerificationEmail(user);
  }

  Future<void> reloadUser() async {
    await _dataFirebaseService.reloadUser();
  }

  User? get currentUser => _dataFirebaseService.currentUser();

  Future<void> signOut() async {
    await _dataFirebaseService.signOut();
  }

  Future<void> uploadUserData(
      UserCredential userCredential, bool isEmailVerified) async {
    await _dataFirebaseService.uploadUserData(userCredential, isEmailVerified);
  }
}
