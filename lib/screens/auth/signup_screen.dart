import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lox_user/constants/ui_constant.dart';
import 'package:lox_user/screens/auth/login_screen.dart';
import 'package:lox_user/screens/home/home_screen.dart';
import 'package:lox_user/themes/app_colors.dart';
import 'package:lox_user/themes/styles/text_styles.dart';
import 'package:lox_user/widgets/buttons/app_button.dart';
import 'package:lox_user/widgets/common/textfield/app_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool confirmNewsLetter = false;

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
              hintText: 'Name',
            ),
            const AppTextField(
              hintText: 'Email',
            ),
            const AppTextField(
              hintText: 'Password',
              obscurable: true,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCheckBox(
                  value: confirmNewsLetter,
                  shouldShowBorder: true,
                  borderColor: lightGrey1,
                  checkedFillColor: primaryColor,
                  borderRadius: 5,
                  borderWidth: 1,
                  checkBoxSize: 22,
                  onChanged: (val) {
                    //do your stuff here
                    setState(() {
                      confirmNewsLetter = val;
                    });
                  },
                ),
                const SizedBox(width: 6),
                const Expanded(
                  child: Text(
                    'I would like to receive your newsletter and other promotional information.',
                    style: TextStyle(
                      color: lightTextColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            AppButton(
              text: 'Sign Up',
              onPressed: () {
                Get.toNamed(HomeScreen.routeName);
              },
            ),
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
        'Sign Up',
        style: appBarHeaderTS,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.toNamed(LoginScreen.routeName);
          },
          child: Text(
            'Login',
            style: buttonTS,
          ),
        )
      ],
    );
  }
}
