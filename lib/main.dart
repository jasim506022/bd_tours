// Import Necessary Package and Files

import 'package:bd_tour_firebase/res/routes/app_routes.dart';
import 'package:bd_tour_firebase/res/getx_localization/languages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Import Constant and Configuration

import 'const/const.dart';
import 'const/gobalcolor.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return GetMaterialApp(
        translations: Languages(),
        locale: const Locale("en", "US"),
        fallbackLocale: const Locale("en", "US"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.black,
            secondaryHeaderColor: AppColors.secondaryColor),

        // Define the initial route of the app
        getPages: AppRoutes.appRoutes(),
        );
  }
}
