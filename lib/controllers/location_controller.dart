import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  Location location = Location();
  Rx<LocationData> locationData = LocationData.fromMap({}).obs;

  get currentLocation => locationData;

  initializeLocation() async {
    await location.requestPermission();
    location.getLocation().then((value) {
      locationData.value = value;
    });
    await location.enableBackgroundMode(enable: true);
    locationListen();
  }

  locationListen() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location\
      locationData.value = currentLocation;
      print('location chage');
      print(locationData.value);
    });
  }

  @override
  void onReady() {
    initializeLocation();
    super.onReady();
  }
}
