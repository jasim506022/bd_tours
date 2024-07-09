import 'package:bd_tour_firebase/page/auth/forgetpasswordpage.dart';
import 'package:bd_tour_firebase/page/auth/loginpage.dart';
import 'package:bd_tour_firebase/page/auth/mainpage.dart';
import 'package:bd_tour_firebase/page/auth/registrationpage.dart';
import 'package:bd_tour_firebase/page/auth/userverifypage.dart';
import 'package:bd_tour_firebase/page/home/homepage.dart';
import 'package:bd_tour_firebase/page/splash/splashpage.dart';
import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../page/edit_profile_page.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashPage,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: RoutesName.loginPage,
          page: () => const LogInPage(),
        ),
        GetPage(
          name: RoutesName.registrationPage,
          page: () => const RegistrationPage(),
        ),
        GetPage(
          name: RoutesName.userVerifyPage,
          page: () => const UserVerifyPage(),
        ),
        GetPage(
          name: RoutesName.forgetPasswordPage,
          page: () => const ForgetPasswordPage(),
        ),
        GetPage(
          name: RoutesName.mainPage,
          page: () => const MainPage(),
        ),
        GetPage(
          name: RoutesName.homepage,
          page: () => const HomePage(),
        ),

    GetPage(
      name: RoutesName.editProfilePage,
      page: () => const EditProfilePage(),
    ),
      ];
}
