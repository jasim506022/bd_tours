import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:see_more/see_more_widget.dart';


import '../../../const/const.dart';
import '../../../res/app_colors.dart';
import '../../../model/guidemodel.dart';
import '../../../res/apps_function.dart';

import '../../../widget/tab_bar_widget_information.dart';
import 'guideaboutwidget.dart';
import 'guideeviewwidget.dart';

class GuideDetailsPage extends StatefulWidget {
  const GuideDetailsPage({super.key});

  @override
  State<GuideDetailsPage> createState() => _GuideDetailsPageState();
}

class _GuideDetailsPageState extends State<GuideDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<String> travelCategories = [
    "History",
    "Museum",
    "Lake",
    "Sea",
    "Revier",
    "Other"
  ];

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: mq.width,
        height: mq.height,
        child: Stack(
          children: [
            Container(
              height: mq.height,
              width: mq.width,
              color: Colors.deepOrange,
            ),
            Image.network(
              guideList[0].image!,
              height: mq.height * .43,
              width: mq.width,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.white70, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(
                        IconlyLight.heart,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: mq.height * .4,
              child: Container(
                height: mq.height,
                width: mq.width,
                decoration: BoxDecoration(
                  color: AppColors.lightwhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      TabWidgetInformation(
                        tabController: tabController,
                        tabList: [
                          AppsFunction.buildTab(title: "About"),
                          AppsFunction.buildTab(title: "Reviews"),
                          AppsFunction.buildTab(title: "Guides"),
                        ],
                        padding: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            // What is Indexed And Understand Clearly this Widget;
                            GuideAboutWidget(
                                travelCategories: travelCategories),
                            const GuideReviewWidget(),
                            IndexedStack(
                              index: 0,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.525,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 11,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 10,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Container(
                                                  height: 80,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white),
                                                  child: Row(
                                                    children: [
                                                      Image.network(
                                                        "https://w7.pngwing.com/pngs/26/907/png-transparent-shahid-afridi-2017-t10-cricket-league-jersey-t10-league-cricket-tshirt-sport-sports-thumbnail.png",
                                                        height: 80,
                                                        width: 80,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Travel Agency",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          "5.0",
                                                                          style: GoogleFonts.poppins(
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 13)),
                                                                      const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .yellow,
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              Text(
                                                                "32 previews tour",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    " @800 m enjoy",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Spacer(),
                                                                  RichText(
                                                                      text: TextSpan(
                                                                          children: [
                                                                        TextSpan(
                                                                            text:
                                                                                "40 \$ ",
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                              color: Color(0xff4600a1),
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16,
                                                                            )),
                                                                        TextSpan(
                                                                          text:
                                                                              "/Person",
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
                                              );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Price",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .black54,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                TextSpan(
                                                                    text:
                                                                        "40 \$ ",
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      color: Color(
                                                                          0xff4600a1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16,
                                                                    )),
                                                                TextSpan(
                                                                  text:
                                                                      "/Person",
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .black54,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          14),
                                                                )
                                                              ])),
                                                        ],
                                                      ),
                                                    )),
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black87,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                        "Book Now",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
