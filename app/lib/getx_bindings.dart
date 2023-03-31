import 'package:finease/main_controller.dart';
import 'package:get/get.dart';


class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
