import 'dart:io';


import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/const.dart';
import '../../../../res/app_colors.dart';
import '../res/apps_function.dart';
import '../controller/profile_controller.dart';
import '../widget/textfieldformwidget.dart';
import '../widget/textform_title_widget.dart';
import 'widget/button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileController _editProfileViewModel = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
     isEdit = Get.arguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                shadows: [
                  BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(.5))
                ]),
          ),
        ),
        body: AppsFunction.futureBuildersFunction(
            editProfileViewModel: _editProfileViewModel,
            widget: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          child: Obx(
                            () => Stack(
                              children: [
                                _editProfileViewModel.profileModel.value.image!
                                            .isEmpty &&
                                        _editProfileViewModel.imageFile.value ==
                                            null
                                    ? Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.red, width: 4)),
                                        child: SvgPicture.asset(
                                            "asset/svg/no_image.svg"),
                                      )
                                    : _editProfileViewModel.imageFile.value ==
                                            null
                                        ? Container(
                                            height: 150,
                                            width: 150,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: ClipOval(
                                              child: Image.network(
                                                _editProfileViewModel
                                                    .profileModel.value.image!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 150,
                                            width: 150,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: ClipOval(
                                              child: Image.file(
                                                File(
                                                  _editProfileViewModel
                                                      .imageFile.value!.path,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                if (isEdit)
                                  Positioned(
                                    bottom: 0,
                                    right: 20,
                                    child: InkWell(
                                      onTap: () async {
                                        _editProfileViewModel
                                            .caputreImageFormGaller();
                                      },
                                      child: Container(
                                        // color: AppColors.deepGreen,
                                        decoration: BoxDecoration(
                                            color: AppColors.deepGreen,
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          )),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormTitleWidget(
                                title: "Name",
                                textFieldWidget: TextFieldFormWidget(
                                  enable: isEdit ? false : true,
                                  hintText: "Name",
                                  controller:
                                      _editProfileViewModel.nameController,
                                  validator: (p0) {},
                                )),
                            TextFormTitleWidget(
                                title: "Phone",
                                textFieldWidget: TextFieldFormWidget(
                                  hintText: "phone",
                                  enable: isEdit ? false : true,
                                  controller:
                                      _editProfileViewModel.phoneController,
                                  validator: (p0) {},
                                )),
                            TextFormTitleWidget(
                                title: "Email",
                                textFieldWidget: TextFieldFormWidget(
                                  hintText: "Email",
                                  enable: false,
                                  controller:
                                      _editProfileViewModel.emailController,
                                  validator: (p0) {
                                    return null;
                                  },
                                )),
                            TextFormTitleWidget(
                                title: "Address",
                                textFieldWidget: TextFieldFormWidget(
                                  enable: isEdit ? false : true,
                                  hintText: "Address",
                                  controller:
                                      _editProfileViewModel.addressController,
                                  validator: (p0) {},
                                )),
                          ],
                        )),
                    Row(
                      children: [
                        Text(
                          "Date of Birth:",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => _editProfileViewModel.dateValue.isEmpty
                              ? Container()
                              : Text(
                                  "${_editProfileViewModel.dateValue[0]!.day}  ${AppsFunction.monthName(_editProfileViewModel.dateValue![0]!.month)},   ${_editProfileViewModel.dateValue![0]!.year}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black),
                                ),
                        ),
                        if (isEdit)
                          IconButton(
                              onPressed: () async {
                                _editProfileViewModel.dateValue.value =
                                    (await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(),
                                  dialogSize: const Size(325, 400),
                                  value: _editProfileViewModel.dateValue,
                                  borderRadius: BorderRadius.circular(15),
                                ))!;

                                // setState(() {});
                              },
                              icon: Icon(
                                Icons.edit_rounded,
                                color: AppColors.red,
                              ))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "gender".tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // understand this code
                        ...Gender.values.map((gender) => Row(
                              children: [
                                Obx(
                                  () => Radio<Gender>(
                                    value: gender,
                                    groupValue: _editProfileViewModel
                                        .selectGenderController
                                        .selectGender
                                        .value,
                                    onChanged: isEdit
                                        ? (genderValue) {
                                            _editProfileViewModel
                                                .selectGenderController
                                                .setGender(genderValue!);
                                          }
                                        : null,
                                  ),
                                ),
                                Text(
                                  _editProfileViewModel.selectGenderController
                                      .genderToString(gender),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    if (isEdit)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomRoundButtonWidget(
                          width: Get.width * .40,
                          onPress: () async {
                            _editProfileViewModel.uploadUserDocument();
                          },
                          title: "Edit Profile",
                        ),
                      )
                  ],
                ),
              ),
            )));
  }
}

/*
import 'dart:io';

import 'package:bd_tour_firebase/res/assets/animation_assets.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/const.dart';
import '../const/gobalcolor.dart';
import '../view_model/controller/profile_controller.dart';
import '../widget/textfieldformwidget.dart';
import '../widget/textform_title_widget.dart';
import 'widget/button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileController _editProfileViewModel = Get.put(ProfileController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool isEdit = Get.arguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                shadows: [
                  BoxShadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(.5))
                ]),
          ),
        ),
        body:

        FutureBuilder<DocumentSnapshot>(
            future: _editProfileViewModel.getCurrentUserDocumentSnapshot(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return AppsFunction.errorDialog(
                    animationAssets: AnimationAssets.noErrorAnimation,
                    title: "Error Occure");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return AppsFunction.errorDialog(
                    animationAssets: AnimationAssets.noErrorAnimation,
                    title: "Error Occure");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                _editProfileViewModel.updateDAtaFromFirebase(snapshot);
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                              ),
                              child: Obx(
                                () => Stack(
                                  children: [
                                    _editProfileViewModel.profileModel.value
                                                .image!.isEmpty &&
                                            _editProfileViewModel
                                                    .imageFile.value ==
                                                null
                                        ? Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 4)),
                                            child: SvgPicture.asset(
                                                "asset/svg/no_image.svg"),
                                          )
                                        : _editProfileViewModel
                                                    .imageFile.value ==
                                                null
                                            ? Container(
                                                height: 150,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: ClipOval(
                                                  child: Image.network(
                                                    _editProfileViewModel
                                                        .profileModel
                                                        .value
                                                        .image!,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 150,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: ClipOval(
                                                  child: Image.file(
                                                    File(
                                                      _editProfileViewModel
                                                          .imageFile
                                                          .value!
                                                          .path,
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                    if (isEdit)
                                      Positioned(
                                        bottom: 0,
                                        right: 20,
                                        child: InkWell(
                                          onTap: () async {
                                            _editProfileViewModel
                                                .caputreImageFormGaller();
                                          },
                                          child: Container(
                                            // color: AppColors.deepGreen,
                                            decoration: BoxDecoration(
                                                color: AppColors.deepGreen,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              )),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormTitleWidget(

                                    title: "Name",
                                    textFieldWidget: TextFieldFormWidget(
                                      enable: isEdit?false:true,
                                      hintText: "Name",
                                      controller:
                                          _editProfileViewModel.nameController,
                                      validator: (p0) {},
                                    )),
                                TextFormTitleWidget(
                                    title: "Phone",
                                    textFieldWidget: TextFieldFormWidget(
                                      hintText: "phone",
                                      enable: isEdit?false:true,
                                      controller:
                                          _editProfileViewModel.phoneController,
                                      validator: (p0) {},
                                    )),
                                TextFormTitleWidget(
                                    title: "Email",
                                    textFieldWidget: TextFieldFormWidget(
                                      hintText: "Email",
                                      enable: false,
                                      controller:
                                          _editProfileViewModel.emailController,
                                      validator: (p0) {
                                        return null;
                                      },
                                    )),
                                TextFormTitleWidget(
                                    title: "Address",
                                    textFieldWidget: TextFieldFormWidget(
                                      enable: isEdit?false:true,
                                      hintText: "Address",
                                      controller: _editProfileViewModel
                                          .addressController,
                                      validator: (p0) {},
                                    )),
                              ],
                            )),
                        Row(
                          children: [
                            Text(
                              "Date of Birth:",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Obx(
                              () => _editProfileViewModel.dateValue.isEmpty
                                  ? Container()
                                  : Text(
                                      "${_editProfileViewModel.dateValue[0]!.day}  ${AppsFunction.monthName(_editProfileViewModel.dateValue![0]!.month)},   ${_editProfileViewModel.dateValue![0]!.year}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black),
                                    ),
                            ),
                            if (isEdit)
                              IconButton(
                                  onPressed: () async {
                                    _editProfileViewModel.dateValue.value =
                                        (await showCalendarDatePicker2Dialog(
                                      context: context,
                                      config:
                                          CalendarDatePicker2WithActionButtonsConfig(),
                                      dialogSize: const Size(325, 400),
                                      value: _editProfileViewModel.dateValue,
                                      borderRadius: BorderRadius.circular(15),
                                    ))!;

                                    // setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.edit_rounded,
                                    color: AppColors.red,
                                  ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "gender".tr,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // understand this code
                            ...Gender.values.map((gender) => Row(
                                  children: [
                                    Obx(
                                      () => Radio<Gender>(
                                        value: gender,
                                        groupValue: _editProfileViewModel
                                            .selectGenderController
                                            .selectGender
                                            .value,
                                        onChanged:
                                                isEdit
                                            ? (genderValue) {
                                                _editProfileViewModel
                                                    .selectGenderController
                                                    .setGender(genderValue!);
                                              }
                                            : null,
                                      ),
                                    ),
                                    Text(
                                      _editProfileViewModel
                                          .selectGenderController
                                          .genderToString(gender),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        if (isEdit)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomRoundButtonWidget(
                              width: Get.width * .40,
                              onPress: () async {
                                _editProfileViewModel.uploadUserDocument();
                              },
                              title: "Edit Profile",
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}

 */
