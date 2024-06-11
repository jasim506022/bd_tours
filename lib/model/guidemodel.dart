// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'reviewmode.dart';

class GuideModel {
  String? name;
  double? ratting;
  String? address;
  double? tourPrice;
  bool? isVerified;
  List<String>? language;
  String? educationQualification;
  List<String>? categories;
  String? image;
  int? previewsTour;
  List<ReviewModel>? reviewModelList;

  GuideModel({this.name,
    this.ratting,
    this.address,
    this.tourPrice,
    this.isVerified,
    this.language,
    this.educationQualification,
    this.categories,
    this.previewsTour,
    this.image,
    this.reviewModelList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ratting': ratting,
      'address': address,
      'tourPrice': tourPrice,
      'isVerified': isVerified,
      'language': language,
      'educationQualification': educationQualification,
      'categories': categories,
      'image': image,
      'previewsTour': previewsTour,
      'reviewModelList': reviewModelList?.map((e) => e?.toMap()).toList(),
    };
  }

  factory GuideModel.fromMap(Map<String, dynamic> map) {
    return GuideModel(
      name: map['name'] != null ? map['name'] as String : null,
      previewsTour:
      map['previewsTour'] != null ? map['previewsTour'] as int : null,
      ratting: map['ratting'] != null ? map['ratting'] as double : null,
      address: map['address'] != null ? map['address'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      tourPrice: map['tourPrice'] != null ? map['tourPrice'] as double : null,
      isVerified: map['isVerified'] != null ? map['isVerified'] as bool : null,
      language: map['language'] != null
          ? List<String>.from((map['language'] as List<String>))
          : null,
      educationQualification: map['educationQualification'] != null
          ? map['educationQualification'] as String
          : null,
      categories: map['categories'] != null
          ? List<String>.from((map['categories'] as List<String>))
          : null,
      reviewModelList: map["reviewModelList"] != null
          ? List<ReviewModel>.from(
          (map['reviewModelList'] as List<int>).map<ReviewModel>(
                (e) => ReviewModel.fromMap(e as Map<String, dynamic>),
          ))
          : null,
    );
  }
}

// reviewList: map['reviewList'] != null
// ? List<ReviewModel>.from(
// (map['reviewList'] as List<int>).map<ReviewModel?>(
// (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
// ),
// )
//     : null,

List<GuideModel> guideList = [
  GuideModel(
      previewsTour: 4,
      reviewModelList: [
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
      ],
      name: "Tanzid Hasan",
      ratting: 4.4,
      address: "Dhaka Bangladesh",
      categories: ["History", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 40,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Tamim Iqbal",
      ratting: 4.6,
      previewsTour: 10,
      address: "Kishoreganj Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 35,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Mushfiqur Rahim",
      ratting: 3.6,
      address: "Mymensingh Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      previewsTour: 15,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 63,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
  GuideModel(
      previewsTour: 4,
      reviewModelList: [
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
      ],
      name: "Tanzid Hasan",
      ratting: 4.4,
      address: "Dhaka Bangladesh",
      categories: ["History", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 40,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Tamim Iqbal",
      ratting: 4.6,
      previewsTour: 10,
      address: "Kishoreganj Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 35,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Mushfiqur Rahim",
      ratting: 3.6,
      address: "Mymensingh Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      previewsTour: 15,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 63,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
  GuideModel(
      previewsTour: 4,
      reviewModelList: [
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
      ],
      name: "Tanzid Hasan",
      ratting: 4.4,
      address: "Dhaka Bangladesh",
      categories: ["History", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 40,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Tamim Iqbal",
      ratting: 4.6,
      previewsTour: 10,
      address: "Kishoreganj Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 35,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Mushfiqur Rahim",
      ratting: 3.6,
      address: "Mymensingh Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      previewsTour: 15,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 63,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),
  GuideModel(
      previewsTour: 4,
      reviewModelList: [
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
      ],
      name: "Tanzid Hasan",
      ratting: 4.4,
      address: "Dhaka Bangladesh",
      categories: ["History", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 40,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c351922/tanzid-hasan.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Tamim Iqbal",
      ratting: 4.6,
      previewsTour: 10,
      address: "Kishoreganj Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 35,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c170899/tamim-iqbal.jpg"),
  GuideModel(
      reviewModelList: [
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
      ],
      name: "Mushfiqur Rahim",
      ratting: 3.6,
      address: "Mymensingh Bangladesh",
      categories: ["River", "Sea", "Mounted"],
      educationQualification: "B.Sc Engineering ",
      isVerified: true,
      previewsTour: 15,
      language: ["Bangla", "English", "Hindi"],
      tourPrice: 63,
      image:
      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c156217/al-amin-hossain.jpg"),

];
