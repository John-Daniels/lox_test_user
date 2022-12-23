import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lox_user/constants/assets_constant.dart';
import 'package:lox_user/constants/ui_constant.dart';
import 'package:lox_user/themes/app_colors.dart';
import 'package:lox_user/widgets/buttons/app_button.dart';
import 'package:lox_user/widgets/common/textfield/app_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String routeName = '/home';

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
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
