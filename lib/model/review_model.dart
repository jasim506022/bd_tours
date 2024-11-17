import 'package:flutter/material.dart';

class ReviewModel with ChangeNotifier {
  String? name;
  String? timeDate;
  num? rating;
  String? description;
  String? image;
  List<String>? commentImage;
  String? reviewId;

  ReviewModel(
      {this.name,
      this.timeDate,
      this.rating,
      this.description,
      this.image,
        this.reviewId,
      this.commentImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'timeDate': timeDate,
      'rating': rating,
      'description': description,
      'image': image,
      'reviewId':reviewId,
      'commentImage': commentImage ?? []
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewId: map['reviewId'] !=null ? map['reviewId'] as String : null,
        name: map['name'] != null ? map['name'] as String : null,
        timeDate: map['timeDate'] != null ? map['timeDate'] as String : null,
        rating: map['rating'] != null ? map['rating'] as num : null,
        description:
            map['description'] != null ? map['description'] as String : null,
        image: map['image'] != null ? map['image'] as String : null,
        commentImage: map['commentImage'] != null
            ? List<String>.from((map['commentImage'] as List<dynamic>).map(
                (e) => e as String,
              ))
            : null);
  }
}

//List<String>.from((map['imageList'] as List<dynamic>).map((x) => x as String))
//           : null,
