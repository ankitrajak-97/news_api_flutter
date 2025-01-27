import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../../../utils/style/app_color.dart';
import '../controller/home_controller.dart';
import '../widget/home_list_item.dart';

class HomeView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.lazyPut<SplashController>(() => SplashController());
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 0.0,
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
          alignment: Alignment.center,
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              // heading
              Container(
                width: Get.width,
                height: Get.height * 0.15,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: kWidth * 2),
                child: Text(
                  "Headlines",
                  style: GoogleFonts.nanumGothic(
                    color: const Color(0xFFE2F558),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              // Container(
              //   color: Colors.pink,
              //   width: Get.width,
              //   height: Get.height * 0.05,
              // ),

              SizedBox(
                width: Get.width,
                height: Get.height * 0.2,
                child: HomeListItem(),
              ),
              // Expanded(
              //   child: Container(
              //     color: Colors.blue,
              //     width: Get.width,
              //     height: Get.height * 0.05,
              //   ),
              // ),
            ],
          )),
    );
  }
}


// https://thehill.com/wp-content/uploads/sites/2/2025/01/Screenshot-2025-01-26-at-8.27.00 AM.png?w=1280
