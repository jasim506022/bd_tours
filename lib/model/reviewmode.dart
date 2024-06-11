import 'package:flutter/material.dart';

class ReviewModel with ChangeNotifier {
  String? name;
  String? timeDate;
  double? rating;
  String? description;
  String? image;

  ReviewModel({
    this.name,
    this.timeDate,
    this.rating,
    this.description,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'timeDate': timeDate,
      'rating': rating,
      'description': description,
      'image': image,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'] != null ? map['name'] as String : null,
      timeDate: map['timeDate'] != null ? map['timeDate'] as String : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
}
