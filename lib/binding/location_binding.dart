import 'package:get/get.dart';

import '../controller/location_controller.dart';
import '../repository/location_repository.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationRepository(), fenix: true);
    Get.lazyPut<LocationController>(
        () => LocationController(
              repository: Get.find<LocationRepository>(),
            ),
        fenix: true);
  }
}
