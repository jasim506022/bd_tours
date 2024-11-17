import 'package:bd_tour_firebase/res/constant.dart';
import 'package:bd_tour_firebase/res/routes/string_constant.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../res/app_colors.dart';

import '../../controller/tour_controller.dart';

import '../../res/apps_function.dart';
import '../../res/apps_text_style.dart';
import '../../controller/profile_controller.dart';

import '../../res/routes/routes_name.dart';
import '../../widget/tab_bar_widget_information.dart';
import '../home/widget/tour_tab_bar_view_widget/widget/list_near_tour_widget.dart';
import '../home/widget/user_profile_widget.dart';
import 'widget/user_information_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final ProfileController editProfileViewModel = Get.find();
  late TabController tabController;
  final tourController = Get.find<TourController>();


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.white,
        child: Column(
          children: [
            const UserInformationWidget(),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: TabWidgetInformation(
                tabController: tabController,
                tabList: [
                  AppsFunction.buildTab(title: "Favourite"),
                  AppsFunction.buildTab(title: "Wallet"),
                  AppsFunction.buildTab(title: "About"),
                ],
                padding: 5,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Container(
                  color: AppColors.lightwhite,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: const ListNearTourWidget(
                      isVertical: true,
                      isProfile: true,
                    ),
                  ),
                ),
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
                          return Text("Bangladesh");
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      _buildProfileListTile(
                          title: "Settings",
                          icon: Icons.settings,
                          function: () {
                            if (kDebugMode) {
                              print("Hello");
                            }
                          }),
                      _buildProfileListTile(
                          title: "Profile",
                          icon: IconlyLight.user2,
                          function: () {
                            Get.toNamed(RoutesName.editProfilePage,
                                arguments: false);
                          }),
                      _buildProfileListTile(
                          title: "Upcoming Tour",
                          icon: Icons.upcoming,
                          function: () {
                            if (kDebugMode) {
                              print("Hello");
                            }
                          }),
                      _buildProfileListTile(
                          title: "History",
                          icon: Icons.history,
                          function: () {
                            if (kDebugMode) {
                              print("Hello");
                            }
                          }),
                      const Divider(),
                      _buildProfileListTile(
                          isLogOut: true,
                          title: "Log out",
                          icon: Icons.logout,
                          function: () {
                            if (kDebugMode) {
                              print("Hello");
                            }
                          }),
                    ],
                  ),
                )
              ]),
            )
          ],
        ));
  }




ListTile _buildProfileListTile(
    {required String title,
      required IconData icon,
      required VoidCallback function,
      bool? isLogOut = false}) {
  return ListTile(
    onTap: function,
    titleTextStyle: GoogleFonts.poppins(
        color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 14),
    title: Text(title),
    leading: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.greenColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(8)),
      child: Icon(
        icon,
        color: AppColors.deepGreen,
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: isLogOut! ? Colors.white : AppColors.black,
      size: 20,
    ),
  );
}





}



/*
 if (snapshot.connectionState == ConnectionState.done) {
                _editProfileViewModel.updateDAtaFromFirebase(snapshot);
                return

                  SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                            children: [
                              _buildUserInformation(),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: CustomRoundButtonWidget(
                                  width: Get.width * .40,
                                  onPress: () {
                                    Get.toNamed(RoutesName.editProfilePage,
                                        arguments: true);
                                  },
                                  title: "Edit Profile",
                                ),
                              )
                              // ElevatedButton(onPressed: () {}, child: Text("")),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildProfileListTile(
                          title: "Settings",
                          icon: Icons.settings,
                          function: () {
                            print("Hello");
                          }),
                      _buildProfileListTile(
                          title: "Profile",
                          icon: IconlyLight.user2,
                          function: () {
                            print("Hello");
                          }),
                      _buildProfileListTile(
                          title: "Upcoming Tour",
                          icon: Icons.upcoming,
                          function: () {
                            print("Hello");
                          }),
                      _buildProfileListTile(
                          title: "History",
                          icon: Icons.history,
                          function: () {
                            print("Hello");
                          }),
                      const Divider(),
                      _buildProfileListTile(
                          isLogOut: true,
                          title: "Settings",
                          icon: Icons.add,
                          function: () {
                            print("Hello");
                          }),
                    ],
                  ),
                );
              }
 */

/*
     Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: CustomRoundButtonWidget(
                                    width: Get.width * .40,
                                    onPress: () {
                                      Get.toNamed(RoutesName.editProfilePage,
                                          arguments: true);
                                    },
                                    title: "Edit Profile",
                                  ),
                                )
                                // ElevatedButton(onPressed: () {}, child: Text("")),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),

                        _buildProfileListTile(
                            title: "Settings",
                            icon: Icons.settings,
                            function: () {
                              if (kDebugMode) {
                                print("Hello");
                              }
                            }),
                        _buildProfileListTile(
                            title: "Profile",
                            icon: IconlyLight.user2,
                            function: () {
                              Get.toNamed(RoutesName.editProfilePage,
                                  arguments: false);
                            }),
                        _buildProfileListTile(
                            title: "Upcoming Tour",
                            icon: Icons.upcoming,
                            function: () {
                              if (kDebugMode) {
                                print("Hello");
                              }
                            }),
                        _buildProfileListTile(
                            title: "History",
                            icon: Icons.history,
                            function: () {
                              if (kDebugMode) {
                                print("Hello");
                              }
                            }),
                        const Divider(),
                        _buildProfileListTile(
                            isLogOut: true,
                            title: "Log out",
                            icon: Icons.logout,
                            function: () {
                              if (kDebugMode) {
                                print("Hello");
                              }
                            }),
 */

/*
        FutureBuilder(
            future: editProfileViewModel.getCurrentUserDocumentSnapshot(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                editProfileViewModel.updateDAtaFromFirebase(snapshot);
                if (snapshot.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      AppsFunction.errorDialog(
                          animationAssets: AnimationAssets.noErrorAnimation,
                          title: "Error Occurred",
                          content: "${snapshot.error!}");
                    },
                  );
                  return Text("Error : ${snapshot.error}");
                } else if (snapshot.hasData && snapshot.data!.exists) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        _buildUserInformation(),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.blueColor,
                                          blurRadius: 1)
                                    ],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.blueColor, width: 1)),
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.white),
                                      color: AppColors.blueColor,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.done,
                                    size: 15,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Verify",
                                style: AppsFontStyle.hintBoldFontStyle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.deepGreen,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.deepGreen,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.deepGreen,
                                  shape: BoxShape.circle),
                            )
                          ],
                        ),
                        SizedBox(
                          child: TabWidgetInformation(
                            tabController: tabController,
                            tabList: [
                              AppsFunction.buildTab(title: "Tour"),
                              AppsFunction.buildTab(title: "Travel Agency"),
                            ],
                            padding: 5,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child:
                              TabBarView(controller: tabController, children: [
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
                                      return Text("Bangladesh");
                                    },
                                  ),
                                )
                              ],
                            )
                          ]),
                        )
                      ],
                    ),
                  ));
                }
              }

              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }));

*/


/*
ListTile _buildProfileListTile(
    {required String title,
      required IconData icon,
      required VoidCallback function,
      bool? isLogOut = false}) {
  return ListTile(
    onTap: function,
    titleTextStyle: GoogleFonts.poppins(
        color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 14),
    title: Text(title),
    leading: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.greenColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(8)),
      child: Icon(
        icon,
        color: AppColors.deepGreen,
      ),
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: isLogOut! ? Colors.white : AppColors.black,
      size: 20,
    ),
  );
}

 */



// Verify
/*
 Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularWidget(
              color: AppColors.red,
              icon: Icons.done,
              size: 25,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Verify",
              style: AppsFontStyle.mediumBoldFontStyle
                  .copyWith(color: AppColors.blueColor),
            ),
          ],
        ),
 */

/*
import 'package:bd_tour_firebase/res/constant.dart';
import 'package:bd_tour_firebase/res/routes/string_constant.dart';
import 'package:bd_tour_firebase/widget/circular_icon_width_background_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../res/app_colors.dart';

import '../../controller/tour_controller.dart';

import '../../res/apps_function.dart';
import '../../res/apps_text_style.dart';
import '../../controller/profile_controller.dart';

import '../../widget/tab_bar_widget_information.dart';
import 'widget/tour_tab_bar_view_widget/widget/list_near_tour_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final ProfileController editProfileViewModel = Get.find();
  late TabController tabController;
  final tourController = Get.find<TourController>();
  final Uri _url = Uri.parse('https://flutter.dev');
  final Uri _whatsappUrl = Uri.parse("whatsapp://send?phone=01980846830");


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightwhite,
        // appBar: AppBar(
        //   backgroundColor: AppColors.lightwhite,
        //   title: const Text(
        //     "Profile",
        //   ),
        //   actions: [
        //     CircularIconWithBackgroundWidget(
        //         size: 25,
        //         padding: 8,
        //         color: AppColors.red,
        //         icon: Icons.settings),
        //     SizedBox(
        //       width: 15.w,
        //     )
        //   ],
        // ),
        body: Column(
          children: [
            _buildUserInformation(),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: TabWidgetInformation(
                tabController: tabController,
                tabList: [
                  AppsFunction.buildTab(title: "Favourite"),
                  AppsFunction.buildTab(title: "Wallet"),
                  AppsFunction.buildTab(title: "About"),
                ],
                padding: 5,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: const ListNearTourWidget(
                    isVertical: true,
                    isProfile: true,
                  ),
                ),
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
                          return Text("Bangladesh");
                        },
                      ),
                    )
                  ],
                ),
                Container()
              ]),
            )
          ],
        ));
  }

  Widget _buildUserInformation() {
    return Column(
      children: [
        Container(
          height: 130.h,
          width: 130.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.red, width: 3),
              shape: BoxShape.circle),
          child: ClipOval(
            child: Image.network(
              sharedPreference!.getString(StringConstant.imagePreferences)!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              Text("Md Jasim Uddin", style: AppsFontStyle.titleFontStyle),
              const SizedBox(
                height: 3,
              ),
              Text(
                "jasim10@gmail.com",
                style: AppsFontStyle.mediumNormalFontStyle
                    .copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: _launchUrl,
              child: Image.asset(
                "asset/social/facebook.png",
                height: 45.h,
                width: 45.h,
              ),
            ),
            Image.asset(
              "asset/social/instagram.png",
              height: 45.h,
              width: 45.h,
            ),
            Image.asset(
              "asset/social/linkedin.png",
              height: 45.h,
              width: 45.h,
            ),
            Image.asset(
              "asset/social/whatsapp.png",
              height: 45.h,
              width: 45.h,
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_whatsappUrl)) {
      throw Exception('Could not launch $_whatsappUrl');
    }
  }
}
 */
