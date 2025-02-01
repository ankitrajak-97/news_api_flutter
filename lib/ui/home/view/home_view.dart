import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/ui/home/widget/home_loader.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../../../components/custom_appbar.dart';
import '../../../utils/style/app_color.dart';
import '../controller/home_controller.dart';
import '../widget/home_chip.dart';
import '../widget/home_country_chip.dart';
import '../widget/home_list_item.dart';

class HomeView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.lazyPut<SplashController>(() => SplashController());
    final controller = Get.put(HomeController());
    // final DropdownController dropdownController = Get.put(DropdownController());
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
              Obx(() {
                var country = controller.selectedCountry.value;
                return CustomAppBar(
                  title: 'Headlines',
                  trailingWidget: HomeCountryChip(
                    onCountryButtonClick: controller.routeToCountryView,
                    shortName: country.code,
                    flagPath: country.flagPath,
                  ),
                );
              }),

              Container(
                width: Get.width,
                height: Get.height * 0.05,
                padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
                child: Obx(() {
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.chipList.length,
                    itemBuilder: (context, index) {
                      // 0 1 2 3 4 5 6
                      final title = controller.chipList[index];
                      final isSelected = controller.chipList[index] == controller.selectedChipText.value;
                      return HomeCategoryChip(
                        chipTitle: title,
                        isSelected: isSelected,
                        onTap: () {
                          controller.updateSelectedChipListByIndex(index: index);
                          // controller.updateSelectedChipListByName(selectedChip: title);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: kWidth * 2,
                      );
                    },
                  );
                }),
              ),

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
                        ? Text(
                            "No Data found. Try again",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final imageUrl = controller.articles[index].urlImg;
                              final author = controller.articles[index].author;
                              final title = controller.articles[index].title;
                              final desc = controller.articles[index].desc;
                              final publishedAt = controller.articles[index].publishedAt;
                              final url = controller.articles[index].url ?? "https://www.google.com";

                              return HomeListItem(
                                imageUrl: imageUrl,
                                author: author,
                                title: title,
                                desc: desc,
                                publishedAt: publishedAt,
                                url: url,
                                onIconButtonClick: () async {
                                  await controller.launchInBrowser(url: url);
                                },
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
