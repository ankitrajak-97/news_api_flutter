import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_api/ui/home/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared_preference/shared_prefs_helper.dart';

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
    final prefs = await SharedPreferences.getInstance();
    String lastViewedTab = prefs.getString('lastViewedTab') ?? 'headlines'; // Default to 'headlines'

    await Future.delayed(2.seconds, () {
      // go to home page
      // Get.to(() => HomeView()); class based approach

      Get.toNamed(HomeView.name,arguments: lastViewedTab); // name based approach
    });
  }

  @override
  void onClose() {
    super.onClose();
    log("controller onClose");
  }
}
