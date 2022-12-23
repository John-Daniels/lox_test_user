import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lox_user/constants/ui_constant.dart';
import 'package:lox_user/themes/app_colors.dart';
import 'package:lox_user/themes/styles/text_styles.dart';
import 'package:lox_user/widgets/buttons/app_button.dart';
import 'package:lox_user/widgets/common/textfield/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/signin';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const AppTextField(
              hintText: 'Email',
            ),
            const AppTextField(
              hintText: 'Password',
              obscurable: true,
            ),
            const SizedBox(height: defaultPadding * 3),
            AppButton(text: 'Log In', onPressed: () {}),
            const SizedBox(height: defaultPadding - 8),
            SizedBox(
              height: 40,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot your password?',
                  style: buttonTS,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.close,
          size: 26,
          color: greyColor,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Login',
        style: appBarHeaderTS,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Signup',
            style: buttonTS,
          ),
        )
      ],
    );
  }
}
