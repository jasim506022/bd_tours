import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? email;
  String? name;
  String? phone;
  String? status;
  String? uid;
  String? gender;
  String? image;
  String? address;
  Timestamp? dateOfBirth;

  ProfileModel(
      {this.gender,
      this.email,
      this.name,
      this.phone,
      this.status,
      this.uid,
      this.image,
      this.address,
      this.dateOfBirth});

  Map<String, dynamic> toMap(
      {bool? isModify = false}) {
    Map<String, dynamic> map = {
      'email': email,
      'name': name,
      "phone": phone,
      "gender": gender,
      "image": image,
      "address": address,
      "dateOfBirth": dateOfBirth,
      // "uid": uid
    };

    if (!isModify!) {
      map['uid'] = uid;
      map['status'] = status;
    }
    return map;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      email: map['email'],
      gender: map['gender'],
      name: map['name'],
      phone: map['phone'],
      status: map['status'],
      uid: map['uid'],
      image: map["image"],
      address: map["address"],
      dateOfBirth: map["dateOfBirth"],
    );
  }
}
