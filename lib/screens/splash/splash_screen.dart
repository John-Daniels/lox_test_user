import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lox_user/constants/assets_constant.dart';
import 'package:lox_user/screens/auth/signup_screen.dart';
import 'package:lox_user/widgets/buttons/app_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  static String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.splashBg,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Image.asset(Assets.splashText),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AppButton(
                  text: 'Get Started',
                  onPressed: () {
                    Get.toNamed(SignupScreen.routeName);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
