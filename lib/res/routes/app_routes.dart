import 'package:bd_tour_firebase/binding/location_binding.dart';
import 'package:bd_tour_firebase/binding/splash_binding.dart';

import 'package:bd_tour_firebase/view/auth/forgetpasswordpage.dart';
import 'package:bd_tour_firebase/view/auth/loginpage.dart';

import 'package:bd_tour_firebase/view/auth/registrationpage.dart';
import 'package:bd_tour_firebase/view/auth/userverifypage.dart';

import 'package:bd_tour_firebase/res/routes/routes_name.dart';
import 'package:bd_tour_firebase/view/tour_details/tour_details_page.dart';
import 'package:get/get.dart';

import '../../view/auth/main_page.dart';
import '../../view/edit_profile_page.dart';
import '../../view/home/home_page.dart';
import '../../view/home/search_page.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/tour_details/widget/tour_about_tab_view/widget/show_image_list_page.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashPage,
            page: () => const SplashScreen(),
            binding: SplashBinding()),
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
            binding: LocationBinding()),
        GetPage(
          name: RoutesName.homepage,
          page: () => const HomePage(),
        ),
        GetPage(
          name: RoutesName.editProfilePage,
          page: () => const EditProfilePage(),
        ),
        GetPage(
          name: RoutesName.tourDetailsPage,
          page: () => const TourDetailsPage(),
        ),
        GetPage(
          name: RoutesName.searchPage,
          page: () => const SearchPage(),
        ),
    GetPage(
      name: RoutesName.showImageListPage,
      page: () =>  const ShowImageListPage(),
    ),
      ];
}
