import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lox_user/constants/assets_constant.dart';
import 'package:lox_user/constants/ui_constant.dart';
import 'package:lox_user/controllers/home_controller.dart';
import 'package:lox_user/controllers/location_controller.dart';
import 'package:lox_user/themes/app_colors.dart';
import 'package:lox_user/widgets/buttons/app_button.dart';
import 'package:lox_user/widgets/common/textfield/app_text_field.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  LocationController loc = Get.find<LocationController>();

  static String routeName = '/home';

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  var cameraZoom = 20.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (state) {
        var currentLocation = state.locationData.value;
        var currentLatLng = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );

        var otherLocation = const LatLng(
          6.55944,
          3.38547,
        );

        List<LatLng> polyPointsCoords = [];
        controller
            .getPolyPoints(
                origin: PointLatLng(
                    currentLatLng.latitude, currentLatLng.longitude),
                destination: PointLatLng(
                  otherLocation.latitude,
                  otherLocation.longitude,
                ))
            .then((value) {
          polyPointsCoords.assignAll(value);
        });

        return Scaffold(
          backgroundColor: Colors.white,
          body: currentLocation != null
              ? Obx(() {
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    // mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: currentLatLng,
                      zoom: cameraZoom,
                    ),
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: polyPointsCoords,
                        geodesic: true,
                        color: primaryColor.withOpacity(0.5),
                        endCap: Cap.roundCap,
                        width: 5,
                      )
                    },

                    // onMapCreated: (GoogleMapController controller) {
                    //   _controller.complete(controller);
                    // },
                    markers: {
                      Marker(
                        markerId: const MarkerId('current'),
                        position: currentLatLng,
                        icon: controller.currentUserIcon.value,
                      ),
                      Marker(
                        markerId: const MarkerId('other'),
                        position: otherLocation,
                        icon: controller.otherMarkerIcon.value,
                      ),
                    },
                  );
                })
              : Container(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.1,
            titleSpacing: defaultPadding,
            title: Row(
              children: [
                const _DestinationIndicator(),
                Expanded(
                  child: Column(
                    children: const [
                      AppTextField(
                        hintText: 'Current Location',
                        allowBottomSpacing: false,
                      ),
                      SizedBox(height: 10),
                      AppTextField(
                        hintText: 'How many bags of rice do you need?',
                        allowBottomSpacing: false,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  padding: const EdgeInsets.all(1),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: greyColor1),
                    ),
                  ),
                  child: const Icon(Icons.add, size: 15),
                )
              ],
            ),
            toolbarHeight: 150,
          ),
          persistentFooterButtons: [
            Container(
              height: 70,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: defaultPadding,
              ),
              child: const AppButton(
                text: 'Done',
              ),
            )
          ],
        );
      },
    );
  }
}

class _DestinationIndicator extends StatelessWidget {
  const _DestinationIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 24,
      child: Column(
        children: [
          Image.asset(Assets.zoom1Icon),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 40,
            width: 1.4,
            color: lightGrey3,
          ),
          Image.asset(Assets.zoom2Icon),
        ],
      ),
    );
  }
}
