import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/profile_model.dart';



class FirebaseServiceProvider {
  // instance of FirebaseAuth
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // instance of FirebaseFirestore
  static final _firestore = FirebaseFirestore.instance;

  // create User With Email and Password Snapshot
  static Future<UserCredential> createUserWithEmilandPasswordSnaphsot(
      {required String email, required String password}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  // upload data create User Data to Firebase Firestore
  static Future<void> uploadUserInformationFirebaseDatabase(
      {required ProfileModel profileModel}) async {
    _firestore
        .collection("user")
        .doc(profileModel.uid)
        .set(profileModel.toMap());
  }

  // static Future<DocumentSnapshot<Map<String, dynamic>>> userDocument(
  //     {required String uid}) async {
  //   return await _firestore.collection("user").doc(uid).get();
  // }

  static Future<bool> isEmailExist({required String email}) async {
    var querySnapshot = await _firestore
        .collection("user")
        .where("email", isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> sendPasswordResetEmail({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  // Create User and Post Data Firebase
  static Future<void> createUserGmail(User user) async {
    ProfileModel profileModel = ProfileModel(
      name: user.displayName,
      gender: "Not Set",
      status: "approved",
      email: user.email,
      phone: user.phoneNumber,
      uid: user.uid,
    );

    _firestore.collection("user").doc(user.uid).set(profileModel.toMap());
  }

  // Create User and Post Data Firebase
  static Future<void> createUserByEmailPassword(
      {required UserCredential userCredential, String? status = "not_approved"
      // required String image
      }) async {
    await _firestore
        .collection("user")
        .doc(userCredential.user!.uid)
        .update({"status": status});
  }

  //Sign in With Email and Passwords

  // static Future<UserCredential> singEmailandPasswordSnapshot(
  //     {required String email, required String password}) async {
  //   return await _auth.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  // }
  //
  //
  // user is Exist on Database
  static Future<bool> userExists() async =>
      (await _firestore.collection("user").doc(_auth.currentUser!.uid).get())
          .exists;

  // Sign In With Gmail
  // static Future<UserCredential?> signWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   return _auth.signInWithCredential(credential);
  // }
}
