import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../model/guidemodel.dart';
import '../../../model/tour_model.dart';
import '../../tour_details/widget/book_now_widget.dart';
import 'guide_details.dart';

class GuideListWidget extends StatelessWidget {
  const GuideListWidget({
    super.key,
    required this.tourModel,
  });

  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 0,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.51,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: guideList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuideDetailsPage(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Row(
                              children: [
                                Image.network(
                                  guideList[index].image!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              guideList[index].name!,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    guideList[index]
                                                        .ratting!
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13)),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          "${guideList[index].previewsTour} previews tour",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              " @800 m enjoy",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            Spacer(),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "${guideList[index].tourPrice!} \$ ",
                                                  style: GoogleFonts.poppins(
                                                    color: Color(0xff4600a1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  )),
                                              TextSpan(
                                                text: "/Person",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              )
                                            ])),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ChangeNotifierProvider.value(
                      value: tourModel,
                      child:  BookNowWidget(),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
