import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../const/gobalcolor.dart';

import '../../res/assets/animation_assets.dart';
import '../../view_model/controller/profile_controller.dart';

import '../widget/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController editProfileViewModel = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                color: AppColors.black),
          ),
          elevation: .5,
        ),
        body:FutureBuilder(
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
                      globalMethod.errorDialog(
                          animationAssets: AnimationAssets.noErrorAnimation,
                          title: "Error Occurred",
                          content: "${snapshot.error!}");
                    },
                  );
                  return Text("Error : ${snapshot.error}");
                } else if (snapshot.hasData && snapshot.data!.exists) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              children: [
                                _buildUserInformation(),

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
                      ],
                    ),
                  );
                }
              }

              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
            })


    );
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

  Column _buildUserInformation() {
    return

      Column(
      children: [
        editProfileViewModel.profileModel.value.image!.isEmpty
            ? Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 4)),
                child: SvgPicture.asset("asset/svg/no_image.svg"),
              )
            : Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.red, width: 3),
                    shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.network(
                    editProfileViewModel.profileModel.value.image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                editProfileViewModel.profileModel.value.name!,
                style: GoogleFonts.poppins(
                    color: AppColors.black,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                editProfileViewModel.profileModel.value.email!,
                style: GoogleFonts.poppins(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ],
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
