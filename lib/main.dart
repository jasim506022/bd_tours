// Import Necessary Package and Files

import 'package:bd_tour_firebase/binding/binding.dart';
import 'package:bd_tour_firebase/res/apps_text_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const/const.dart';
import '../../../../res/app_colors.dart';
import 'controller/category_controller.dart';
import 'firebase_options.dart';
import 'res/constant.dart';
import 'res/getx_localization/languages.dart';
import 'res/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreference = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: const Size(360.0, 800.0),
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: InitialBinding(),
          translations: Languages(),
          locale: const Locale("en", "US"),
          fallbackLocale: const Locale("en", "US"),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: AppsFontStyle.appBarTitleFontStyle),
              primaryColor: AppColors.black,
              secondaryHeaderColor: AppColors.secondaryColor),
          // Define the initial route of the app
          getPages: AppRoutes.appRoutes(),
        );
      },
    );
  }
}

class CategoryDropDownWidget extends StatelessWidget {
  const CategoryDropDownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.find<CategoryController>();

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(color: AppColors.blueColor, width: 2)),
        width: 1.sw,
        child: DropdownButtonFormField(
          dropdownColor: AppColors.lightwhite,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          borderRadius: BorderRadius.circular(15),
          style: AppsFontStyle.mediumBoldFontStyle,
          hint: const Text("Select Tour Category"),
          value: categoryController.currentCategory.value,
          items: travelCategories.map(
            (category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            },
          ).toList(),
          onChanged: (value) {
            categoryController.setCategory(category: value.toString());
          },
        ),
      ),
    );
  }
}
