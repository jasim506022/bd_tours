import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../../../../../model/review_model.dart';
import '../../../../../model/tour_model.dart';
import 'comment_widget.dart';

class ListCommentsWidget extends StatelessWidget {
  const ListCommentsWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("tours")
          .doc(tourModel.id)
          .collection("review")
          .orderBy("reviewId", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available'));
        }
        print(snapshot.data!.docs[0]['name']);

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var reviewModel =
                ReviewModel.fromMap(snapshot.data!.docs[index].data());
            if (snapshot.data!.docs.length == 0) {
              return Text("NO Reviewws");
            } else {
              return  CommentWidget(reviewModel: reviewModel,);
            }
          },
        );
      },
    );
  }
}
