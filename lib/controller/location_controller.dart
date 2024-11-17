import 'package:get/get.dart';

import '../model/location_model.dart';
import '../repository/location_repository.dart';

class LocationController extends GetxController {
  final LocationRepository repository;

  LocationController({required this.repository});

  var currentLocation = "".obs;

  var locationModel = Rx<LocationModel?>(null);

  @override
  Future<void> onInit() async {
    fetchCurrentLocation();
    super.onInit();
  }

  Future<void> fetchCurrentLocation() async {
    if (currentLocation.value.isEmpty) {
      try {
        final location = await repository.getCurrentLocation();
        if (location != null) {
          locationModel.value = location;
          currentLocation.value = location.address;
        }
      } catch (e) {
        currentLocation.value = e.toString();
      }
    }
  }

  String getLocation() {
    return locationModel.value?.address ?? "Location is not available";
  }
}
