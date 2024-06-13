import 'dart:io';

import 'package:bd_tour_firebase/data/network/base_firebase_service.dart';
import 'package:bd_tour_firebase/data/response/app_exception.dart';
import 'package:bd_tour_firebase/model/profilemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DataFirebaseService implements BaseFirebaseService {
  @override
  // TODO: implement auth
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  //Sign in With Email and Passwords
  @override
  Future<UserCredential> signInEmailandPasswordSnapshot(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocumentById(
      {required String uid}) async {
    return await firestore.collection("user").doc(uid).get();
  }

  // Sign In With Gmail
  @override
  Future<UserCredential?> signWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return auth.signInWithCredential(credential);
  }

  // user is Exist on Database
  @override
  Future<bool> userExists() async =>
      (await firestore.collection("user").doc(auth.currentUser!.uid).get())
          .exists;

  @override
  Future<void> createUserGmail(User user) async {
    ProfileModel profileModel = ProfileModel(
      name: user.displayName,
      gender: "Not Set",
      status: "approved",
      email: user.email,
      phone: user.phoneNumber,
      uid: user.uid,
    );

    firestore.collection("user").doc(user.uid).set(profileModel.toMap());
  }

  @override
  Future<void> createUserByEmailPassword(
      {required UserCredential userCredential, String? status = "not_approved"
      // required String image
      }) async {
    await firestore
        .collection("user")
        .doc(userCredential.user!.uid)
        .update({"status": status});
  }

  // create User With Email and Password Snapshot
  @override
  Future<UserCredential> createUserWithEmilandPasswordSnaphsot(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  // upload data create User Data to Firebase Firestore
  @override
  Future<void> uploadUserInformationFirebaseDatabase(
      {required ProfileModel profileModel}) async {
    firestore
        .collection("user")
        .doc(profileModel.uid)
        .set(profileModel.toMap());
  }

  @override
  Future<bool> isEmailExist({required String email}) async {
    var querySnapshot = await firestore
        .collection("user")
        .where("email", isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendVerificationEmail(User user) async {
    await user.sendEmailVerification();
  }

  @override
  Future<void> reloadUser() async {
    await auth.currentUser!.reload();
  }

  @override
  User? currentUser() => auth.currentUser;

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> uploadUserData(
      UserCredential userCredential, bool isEmailVerified) async {
    await createUserByEmailPassword(
      status: isEmailVerified ? "approved" : "not_approved",
      userCredential: userCredential,
    );
  }
}
