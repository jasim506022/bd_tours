import 'dart:io';

import 'package:bd_tour_firebase/data/network/base_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/profile_model.dart';
import '../../model/review_model.dart';

class DataFirebaseService implements BaseFirebaseService {
  var tourCollectionReference = FirebaseFirestore.instance.collection("tours");

  CollectionReference<Map<String, dynamic>> reviewCollectionReference(
      String id) {
    return tourCollectionReference.doc(id).collection("review");
  }

  @override
  // TODO: implement auth
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  // TODO: implement storageReference
  Reference get storageReference => FirebaseStorage.instance.ref();

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

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>>
      getCurrentUserDocumentSnapshot() {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser!.uid)
        .get();
  }

  Future<List<String>> uploadImageStorage(
      {required List<XFile> imageList, required String folderName}) async {
    List<String> imageUrlList = [];

    for (var image in imageList) {
      await postImage(image, folderName)
          .then((downLoadUrl) => imageUrlList.add(downLoadUrl));
    }
    return imageUrlList;
  }

  Future<String> postImage(XFile? imageFile, String folderName) async {
    final uniqueImageName =
        "${imageFile!.name}_${DateTime.now().millisecondsSinceEpoch}";
    final ref = FirebaseStorage.instance
        .ref()
        .child("$folderName/Review/$uniqueImageName");
    UploadTask uploadTax = ref.putFile(File(imageFile.path));
    var taskSnapshot = await uploadTax.whenComplete(
      () {},
    );
    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Future<String> imageUploadedUrl({required String path}) async {
    final date = DateTime.now();
    final imagesRef = storageReference
        .child("image")
        .child(auth.currentUser!.uid)
        .child("profileImage")
        .child(
            "${date.day}-${date.month}-${date.year}/${date.millisecondsSinceEpoch}");
    UploadTask uploadTask = imagesRef.putFile(File(path));
    var taskSnapshot = await uploadTask.whenComplete(
      () {},
    );
    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Future<void> uploadEditProfileSnapshot(
      {required ProfileModel profileModel}) async {
    await firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .update(profileModel.toMap(isModify: true));
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> tourSnapshot(
      {required String category}) {
    final query = tourCollectionReference.orderBy("id", descending: true);

    var filteredQuery = category == "All"
        ? query
        : query.where("category", isEqualTo: category);

    return filteredQuery.snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> popularTourSnapshot(
      {required String category}) {
    final query =
        tourCollectionReference.where("ratting", isGreaterThanOrEqualTo: 3.5);
    var filteredQuery = category == "All"
        ? query
        : query.where("category", isEqualTo: category);

    return filteredQuery.snapshots();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> singleTourSnapshot(
      {required String tourId}) {
    return tourCollectionReference.doc(tourId).snapshots();
  }

  @override
  Future<void> postReviewed(
      {required String tourId, required ReviewModel reviewModel}) async {
    reviewCollectionReference(tourId)
        .doc(reviewModel.reviewId)
        .set(reviewModel.toMap());
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> reviewSnapshot(
      {required String tourId}) {
    return reviewCollectionReference(tourId).snapshots();
  }

  @override
  Future<void> updateTourSnapshot(
      {required num rating,
      required int totalReviews,
      required String tourId}) async {
    tourCollectionReference
        .doc(tourId)
        .update({"ratting": rating, "totalreview": totalReviews});
  }
}
