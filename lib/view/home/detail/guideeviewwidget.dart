import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:see_more/see_more_widget.dart';


import '../../../const/const.dart';
import '../../../model/review_model.dart';
import '../../../res/app_colors.dart';
import '../../../model/guidemodel.dart';

import '../../tour_details/widget/book_now_widget.dart';
import '../../tour_details/widget/tour_review_tab_view/widget/comment_widget.dart';

class GuideReviewWidget extends StatefulWidget {
  const GuideReviewWidget({
    super.key,
  });

  @override
  State<GuideReviewWidget> createState() => _TourReviewsWidgetState();
}

class _TourReviewsWidgetState extends State<GuideReviewWidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 0,
      children: [
        SizedBox(
          height: mq.height * 0.51,
          width: mq.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "5,0",
                              style: GoogleFonts.poppins(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "(${guideList[0].reviewModelList!.length} reviews)",
                              style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: double.infinity, // What is meaning this,
                          child: Row(
                            children: [
                              if (guideList[0].reviewModelList!.length > 5)
                                for (int i = 0; i < 5; i++)
                                  Align(
                                    widthFactor: .65,
                                    child: CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(
                                          guideList[0]
                                              .reviewModelList![0]
                                              .image!,
                                        )),
                                  )
                              else
                                for (int i = 0;
                                    i < guideList[0].reviewModelList!.length;
                                    i++)
                                  Align(
                                    widthFactor: .65, // What is Width Factor
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage(
                                        guideList[0].reviewModelList![0].image!,
                                      ),
                                    ),
                                  ),
                              Text(
                                "${guideList[0].reviewModelList!.length} like this",
                                style: GoogleFonts.poppins(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(hintText: "Comment Here"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              guideList[0].reviewModelList!.add(ReviewModel(
                                  image:
                                      "https://static.cricbuzz.com/a/img/v1/152x152/i1/c332891/virat-kohli.jpg",
                                  name: "Rony Ahmed",
                                  timeDate: "2",
                                  rating: 5.2,
                                  description:
                                      "It became a no-brainer when he was asked to captain the Bangalore franchise on a permanent basis from 2012 and it also translated into more consistency with the bat. Kohli soon turned into a fan favourite even as runs flowed from his bat and eventually becoming the leading-run scorer in the history of IPL. Circa, 2016 - the India and RCB captain blasted 973 runs - the most by any player in the history of the game and it included four hundreds - the most by a batsman in a single edition. Alas, all this didn't translate into a title triumph - one that has kept Kohli and Bangalore waiting so far (As of March 2023)."));
                              setState(() {});
                            },
                            child: Text("Comment")),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: guideList[0].reviewModelList!.length,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                                value: guideList[0].reviewModelList![index],
                                child:  CommentWidget(reviewModel: guideList[0].reviewModelList![index],));
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(flex: 3, child: BookingGuideWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
