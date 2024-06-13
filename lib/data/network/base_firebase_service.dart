import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/profilemodel.dart';

abstract class BaseFirebaseService {
  FirebaseAuth get auth;

  FirebaseFirestore get firestore;

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

  Future<void> signOut();

  Future<void> uploadUserData(
      UserCredential userCredential, bool isEmailVerified);
}
