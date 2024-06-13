import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';
import '../data/response/app_exception.dart';
import '../model/profilemodel.dart';

class RegistrationRepository {

  final _dataFirebaseService = DataFirebaseService();

  Future<UserCredential> createUserWithEmilandPasswordSnaphsot(
      {required String email, required String password}) {
    try {
      return _dataFirebaseService.createUserWithEmilandPasswordSnaphsot(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }

  Future<void> uploadUserInformationFirebaseDatabase(
      {required ProfileModel profileModel}) async {
    try {
      _dataFirebaseService.uploadUserInformationFirebaseDatabase(
          profileModel: profileModel);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }
}
