import 'package:bd_tour_firebase/res/routes/app_routes.dart';
import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart' as location;
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';
import '../../widget/tabbarwidgetinformation.dart';
import 'tour_tab_bar_view_widget/tours_tabbar_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  // String _address = '';
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    tabController = TabController(length: 2, vsync: this);
  }

  int currentIndex = 0;

  // Use for status bar color change
  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.lightwhite,
        statusBarIconBrightness: Brightness.dark));
    super.didChangeDependencies();
  }

  String address = "";

  Location location = Location();

  bool serviceEnabl = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  getCurrentLocation() async {
    serviceEnabl = await location.serviceEnabled();
    if (serviceEnabl == null || !serviceEnabl) {
      serviceEnabl = await location.requestService();
      if (!serviceEnabl) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      _locationData = await location.getLocation();
      if (_locationData != null) {
        if (kDebugMode) {
          print('Latitude: ${_locationData!.latitude}');
        }
        print('Longitude: ${_locationData!.longitude}');
        String locationText =
            'Latitude: ${_locationData!.latitude}, Longitude: ${_locationData!.longitude}';
        _getAddressFromCoordinates(
            _locationData!.latitude!, _locationData!.longitude!);
        print(locationText);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        geocoding.Placemark placemark = placemarks[0];
        String completeAddress = '${placemark.locality}, ${placemark.country}';
        //'${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        setState(() {
          address = completeAddress;
        });

        print(completeAddress);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.lightwhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                // User Profile
                _buildUserProfile(),

                const SizedBox(
                  height: 20,
                ),
                //Search
                _buildSearch(),

                SizedBox(
                  height: mq.width * .044,
                ),

                // TabBar
                TabWidgetInformation(
                  tabController: tabController,
                  tabList: [
                    globalMethod.buildTab(title: "Tour"),
                    globalMethod.buildTab(title: "Guides"),
                  ],
                  padding: 10,
                ),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    const ToursTabBarViewWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Travel Agency",
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(5),
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Travel Agency",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("5.0",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      13)),
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "32 previews tour",
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  const Spacer(),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "40 \$ ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xff4600a1),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        )),
                                                    TextSpan(
                                                      text: "/Person",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          )),
    );
  }

  // Search Build
  SizedBox _buildSearch() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 14,
            child: TextFormField(
              style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                hintText: "Search",
                prefixIcon: Icon(
                  IconlyLight.search,
                  color: AppColors.secondaryColor,
                ),
                border: InputBorder.none,
                enabledBorder: _outlineInputBorder(),
                focusedBorder: _outlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: mq.width * .022,
          ),
          Expanded(
              flex: 2,
              child: Icon(
                IconlyBold.filter,
                color: AppColors.blueColor,
              ))
        ],
      ),
    );
  }

  // OutlineInput Design
  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.white, width: 0),
    );
  }

  // User Profile
  Row _buildUserProfile() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 2, color: AppColors.blueColor)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              "https://w7.pngwing.com/pngs/26/907/png-transparent-shahid-afridi-2017-t10-cricket-league-jersey-t10-league-cricket-tshirt-sport-sports-thumbnail.png",
              height: mq.width * .11,
              width: mq.width * .11,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: mq.width * 0.033,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Md Jasim Uddin",
              style: GoogleFonts.poppins(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              address,
              style: GoogleFonts.poppins(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();
            Get.offNamedUntil(
              RoutesName.loginPage, (route) => false,
            );
          },
          child: Icon(
            IconlyLight.notification,
            color: AppColors.secondaryColor,
            size: 25,
          ),
        )
      ],
    );
  }
}
