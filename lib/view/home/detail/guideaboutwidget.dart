import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';


import '../../../const/const.dart';
import '../../../res/app_colors.dart';
import '../../../model/guidemodel.dart';
import '../../tour_details/widget/book_now_widget.dart';

class GuideAboutWidget extends StatelessWidget {
  const GuideAboutWidget({
    super.key,
    required this.travelCategories,
  });

  final List<String> travelCategories;

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
                              guideList[0].name!,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  fontSize: 18),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "5.0",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black87,
                            ),
                            Text(
                              guideList[0].address!,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Text(
                              "Total Price: ",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "${guideList[0].tourPrice!} \$ ",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.blueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              TextSpan(
                                text: "/Person",
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ])),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.verified_outlined,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              guideList[0].isVerified!
                                  ? "Verified Guide"
                                  : " Not Verified Guide ",
                              style: GoogleFonts.poppins(
                                  color: guideList[0].isVerified!
                                      ? Colors.black87
                                      : Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.language,
                                color: Colors.black87,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              for (int i = 0;
                                  i < guideList[0].language!.length;
                                  i++)
                                Text(
                                  "${guideList[0].language![i]}, ",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Ionicons.school,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              guideList[0].educationQualification!,
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Text(
                          "Categories",
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        // Categories List
                        SizedBox(
                          height: 55,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: travelCategories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white),
                                  child: Text(
                                    travelCategories[index],
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
