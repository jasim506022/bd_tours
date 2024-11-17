import 'package:flutter/cupertino.dart';

import '../../../model/review_model.dart';



class ReviewListProvider with ChangeNotifier {
  List<ReviewModel> list = [
    ReviewModel(
        name: "Tanzid Hasan",
        rating: 4.4,
        timeDate: "3 days",
        description:
        "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
    ReviewModel(
        name: "Moeen Ali",
        rating: 3.2,
        timeDate: "2 days",
        description:
        "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
    ReviewModel(
        name: "Tanzid Hasan",
        rating: 4.4,
        timeDate: "3 days",
        description:
        "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
    ReviewModel(
        name: "Moeen Ali",
        rating: 3.2,
        timeDate: "2 days",
        description:
        "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
    ReviewModel(
        name: "Tanzid Hasan",
        rating: 4.4,
        timeDate: "3 days",
        description:
        "The 17th-century Mughal fort, which stands by the Buriganga River, is one of the oldest architectural structures in Bangladesh. It was built by the then Mughal Subahdar Muhammad Azam Shah, son of Emperor Aurangzeb. It is believed ",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
    ReviewModel(
        name: "Moeen Ali",
        rating: 3.2,
        timeDate: "2 days",
        description:
        "He was a child prodigy and at the tender age of 15 rivalled many established cricketers. He was awarded the captaincy of England's Under-19 squad for the 2006 World Cup and took the team to the semi-finals, a particularly impressive performance coming from a 11-0 drubbing received in Bangladesh, earlier that year. Moeen, continued to be a consistent performer for Worcestershire and was the acting captain at the start of the 2011 season as the usual club captain, Daryl Mitchell was injured.",
        image:
        "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351579/moeen-ali.jpg"),
  ];

  List<ReviewModel> get listReview => list;

  addListReviewModel({required ReviewModel reviewModel}) {
    list.add(reviewModel);
    notifyListeners();
  }


}
