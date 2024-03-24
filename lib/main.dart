import 'package:bd_tour_firebase/page/auth/loginpage.dart';
import 'package:bd_tour_firebase/service/provider/loadingprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/approutes.dart';
import 'const/const.dart';
import 'const/gobalcolor.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        Provider<LoadingProvider>(create: (_) => LoadingProvider()),
        // Provider<ReviewListProvider>(create: (_) => ReviewListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: AppColors.blueColor,
            secondaryHeaderColor: AppColors.secondaryColor),
        initialRoute: AppRouters.signPage,
        routes: {
          AppRouters.signPage: (context) => const LogInPage(),
          // // AppRouters.detailsPage: (context) => const DetailsTourPage(),
          // AppRouters.signupPage: (context) => const SignUpScreen(),
          // AppRouters.homepage: (context) => const HomePage(),
          // AppRouters.splashPage: (context) => const SplashPage(),
          // AppRouters.guidedetailsPage: (context) => const GuideDetailsPage(),
          // AppRouters.profilePage: (context) => const ProfilePage(),
          // AppRouters.editprofilePage: (context) => const EditProfilePage(
          //   isEdit: false,
          // ),
          // AppRouters.mainPage: (context) => const MainPage()
        },
      ),
    );
  }
}
