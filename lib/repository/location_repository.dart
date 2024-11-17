import 'package:location/location.dart';

import '../model/location_model.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationRepository {
  Location location = Location();

  Future<LocationModel?> getCurrentLocation() async {
    bool serviceEnable = await location.serviceEnabled();

    if (!serviceEnable) {
      serviceEnable = await location.requestService();
      if (!serviceEnable) return null;
    }
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return null;
    }
    try {
      LocationData locationData = await location.getLocation();
      String address = await _getAddressFromCoordinates(
          locationData.latitude!, locationData.longitude!);
      return LocationModel(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        address: address,
      );
    } catch (e) {
      return null;
    }
  }

  Future<String> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<geocoding.Placemark> placeMarks =
          await geocoding.placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        geocoding.Placemark placeMark = placeMarks.first;
        return '${placeMark.locality}, ${placeMark.country}';
      }
    } catch (e) {
      return ("Error: $e");
    }
    return "Unknown Location";
  }
}


