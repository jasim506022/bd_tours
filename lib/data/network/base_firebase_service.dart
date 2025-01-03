import 'dart:io';

import 'package:bd_tour_firebase/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../model/profile_model.dart';

abstract class BaseFirebaseService {
  FirebaseAuth get auth;

  FirebaseFirestore get firestore;

  Reference get storageReference;

  //Sign in With Email and Passwords
  Future<UserCredential> signInEmailandPasswordSnapshot(
      {required String email, required String password});

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocumentById(
      {required String uid});

  // Sign In With Gmail
  Future<UserCredential?> signWithGoogle();

  // user is Exist on Database
  Future<bool> userExists();

  // Create User and Post Data Firebase
  Future<void> createUserGmail(User user);

  // create User With Email and Password Snapshot
  Future<UserCredential> createUserWithEmilandPasswordSnaphsot(
      {required String email, required String password});

  // upload data create User Data to Firebase Firestore
  Future<void> uploadUserInformationFirebaseDatabase(
      {required ProfileModel profileModel});

  Future<bool> isEmailExist({required String email});

  Future<void> sendPasswordResetEmail({required String email});

  // Create User and Post Data Firebase
  Future<void> createUserByEmailPassword(
      {required UserCredential userCredential,
      String? status = "not_approved"});

  Future<void> sendVerificationEmail(User user);

  Future<void> reloadUser();

  User? currentUser();

  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required String category});

  Stream<QuerySnapshot<Map<String, dynamic>>> popularTourSnapshot(
      {required String category});

  Future<void> signOut();

  Future<void> uploadUserData(
      UserCredential userCredential, bool isEmailVerified);

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserDocumentSnapshot();


  Stream<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot({required String tourId});
  Future<String> imageUploadedUrl({required String path});

  Future<void> uploadEditProfileSnapshot({required ProfileModel profileModel});

  Future<void> postReviewed(
      {required String tourId, required ReviewModel reviewModel});

  Stream<QuerySnapshot<Map<String, dynamic>>> reviewSnapshot(
      {required String tourId});

  Future<void> updateTourSnapshot({required num rating, required int totalReviews, required String tourId});
}
