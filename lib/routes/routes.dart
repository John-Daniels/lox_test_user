import 'package:get/get.dart';
import 'package:lox_user/controllers/home_controller.dart';
import 'package:lox_user/screens/auth/login_screen.dart';
import 'package:lox_user/screens/auth/signup_screen.dart';
import 'package:lox_user/screens/home/home_screen.dart';
import 'package:lox_user/screens/splash/splash_screen.dart';

class AppRouter {
  static List<GetPage> get routes => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: SignupScreen.routeName,
          page: () => const SignupScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
            name: HomeScreen.routeName,
            page: () => HomeScreen(),
            transition: Transition.rightToLeftWithFade,
            binding: BindingsBuilder(() {
              Get.put(HomeController());
            })),
      ];
}
