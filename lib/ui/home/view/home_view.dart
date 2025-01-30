import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/dropdown/dropdowncontroller.dart';
import 'package:news_api/ui/home/widget/home_loader.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../../../utils/style/app_color.dart';
import '../controller/home_controller.dart';
import '../widget/home_chip.dart';
import '../widget/home_list_item.dart';

class HomeView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.lazyPut<SplashController>(() => SplashController());
    final controller = Get.put(HomeController());
    final DropdownController dropdownController = Get.put(DropdownController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 0.0,
      ),
      backgroundColor: kBackgroundColor,
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              // heading
              Container(
                color: Colors.indigo,
                width: Get.width,
                height: Get.height * 0.1,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: kWidth * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Headlines",
                      style: GoogleFonts.nanumGothic(
                        color: Colors.white54,
                        fontSize: 28.0.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Obx(() => DropdownButton<String>(
                          value: dropdownController
                              .selectedValue.value, // GetX state
                          hint: Text("Select Country"),
                          items: dropdownController.dropDownList
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged:
                              dropdownController.setSelected, // Update value
                        )),
                  ],
                ),
              ),
              // SizedBox(
              //   width: Get.width,
              //   height: Get.height * 0.05,
              //   child: HomeChip(
              //     chipTitle: 'Health',
              //     onTap: () {
              //       print("health");
              //     },
              //   ),
              // ),

              Container(
                  width: Get.width,
                  height: Get.height * 0.05,
                  padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.chipList.length,
                    itemBuilder: (context, index) {
                      final title = controller.chipList[index];
                      return HomeChip(
                        chipTitle: title,
                        onTap: () {
                          controller.updateSelectedChipList(
                              selectedChip: title);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: kWidth * 2,
                      );
                    },
                  )),

              SizedBox(
                height: kHeight * 2,
              ),

              // SizedBox(
              //   width: Get.width,
              //   height: Get.height * 0.2,
              //   child: HomeListItem(),
              // ),

              // is loading true -> visible false
              Expanded(
                child: Obx(() {
                  return Visibility(
                    visible: !controller.isLoading.value,
                    replacement: Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.8,
                      child: HomeLoader(),
                    ),
                    child: controller.articles.isEmpty
                        ? Container(
                            child: Text(
                              "No Data found. Try again",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final imageUrl =
                                  controller.articles[index].urlImg;
                              final author = controller.articles[index].author;
                              final title = controller.articles[index].title;
                              final desc = controller.articles[index].desc;
                              final publishedAt =
                                  controller.articles[index].publishedAt;
                              final url = controller.articles[index].url;

                              return HomeListItem(
                                imageUrl: imageUrl,
                                author: author,
                                title: title,
                                desc: desc,
                                publishedAt: publishedAt,
                                url: url,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.white12,
                                height: 1.0,
                              );
                            },
                            itemCount: controller.articles.length,
                          ),
                  );
                }),
              ),

              // HomeLoader(),
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
