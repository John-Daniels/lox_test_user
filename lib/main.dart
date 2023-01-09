import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lox_user/core/bindings/initial_bindings.dart';
import 'package:lox_user/routes/routes.dart';
import 'package:lox_user/screens/splash/splash_screen.dart';
import 'package:lox_user/themes/theme.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get initialRoute => SplashScreen.routeName;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      title: 'LoX test',
      getPages: AppRouter.routes,
      theme: AppTheme().buildTheme(),
      initialRoute: initialRoute,
    );
  }
}
