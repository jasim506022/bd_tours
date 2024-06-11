import 'dart:io';

import 'package:bd_tour_firebase/data/response/app_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/network/data_firebase_service.dart';

class LoginRepository {
  final _dataFirebaseService = DataFirebaseService();

  Future<UserCredential> signInEmailandPasswordSnapshot(
      {required String email, required String password}) async {
    try {
      return await _dataFirebaseService.signInEmailandPasswordSnapshot(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocumentById(
      {required String uid}) async {
    try {
      return await _dataFirebaseService.getUserDocumentById(uid: uid);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }

  Future<UserCredential?> signWithGoogle() async {
    try {
      return await _dataFirebaseService.signWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }


  Future<bool> userExists() async {
    try{
      return await _dataFirebaseService.userExists();
    }
    on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }


  Future<void> createUserGmail(User user) async {
    try{
      await _dataFirebaseService.createUserGmail(user);
    }
    on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e);
    } on SocketException catch (e) {
      throw InternetException(e.toString());
    } catch (e) {
      throw OthersException(e.toString());
    }
  }
}
