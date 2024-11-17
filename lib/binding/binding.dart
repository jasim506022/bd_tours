
import 'package:get/get.dart';

import '../controller/category_controller.dart';
import '../controller/review_controller.dart';
import '../controller/tour_controller.dart';
import '../repository/profile_repository.dart';
import '../controller/profile_controller.dart';
import '../repository/review_repository.dart';
import '../repository/tour_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(() => ProfileRepository());

    Get.lazyPut<ProfileController>(
        () => ProfileController(repository: Get.find<ProfileRepository>()),
        fenix: true);

    Get.lazyPut<TourRepository>(
      () => TourRepository(),
    );

    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);

    Get.lazyPut<TourController>(
      () => TourController(repository: Get.find<TourRepository>()),
    );

    Get.lazyPut<ReviewRepository>(
          () => ReviewRepository(),
    );

    Get.lazyPut<ReviewController>(
          () => ReviewController(repository: Get.find<ReviewRepository>()),
    );
  }
}
