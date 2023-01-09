import 'package:get/get.dart';
import 'package:lox_user/controllers/location_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put(AuthController(), permanent: true);

    Get.put(LocationController(), permanent: true);
  }
}
