import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lox_user/constants/assets_constant.dart';
import 'package:lox_user/constants/google_maps.dart';
import 'package:lox_user/helpers/index.dart';

class HomeController extends GetxController {
  var currentUserIcon = BitmapDescriptor.defaultMarker.obs;
  var otherMarkerIcon = BitmapDescriptor.defaultMarker.obs;
  void addIcons() async {
    final Uint8List currentLocationIcon =
        await getBytesFromAsset(Assets.currentLocationIcon, 50);
    currentUserIcon.value = BitmapDescriptor.fromBytes(currentLocationIcon);

    final Uint8List newPinMarkerIcon =
        await getBytesFromAsset(Assets.newPinMarkerIcon, 80);
    otherMarkerIcon.value = BitmapDescriptor.fromBytes(newPinMarkerIcon);
  }

  Future<List<LatLng>> getPolyPoints({
    required PointLatLng origin,
    required PointLatLng destination,
  }) async {
    List<LatLng> polylineCoordinates = [];

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      maps_api_key,
      origin,
      destination,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }

    return polylineCoordinates;
  }

  @override
  void onReady() {
    addIcons();

    super.onReady();
  }
}
