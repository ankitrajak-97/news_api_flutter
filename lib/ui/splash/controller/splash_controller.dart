import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_api/ui/home/view/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log("controller onInit");
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    log("controller onReady");

    await Future.delayed(5.seconds, () {
      // go to home page
      // Get.to(() => HomeView()); class based approach

      Get.toNamed(HomeView.name); // name based approach
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log("controller onClose");
  }
}
