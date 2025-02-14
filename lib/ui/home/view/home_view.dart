import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/ui/home/widget/home_loader.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../../../components/custom_appbar.dart';
import '../../../utils/style/app_color.dart';
import '../controller/home_controller.dart';
import '../widget/home_country_chip.dart';
import '../widget/home_horizontal_category.dart';
import '../widget/home_list_item.dart';
import '../widget/home_searchbox.dart';

class HomeView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.lazyPut<SplashController>(() => SplashController());
    final controller = Get.put(HomeController());
    // final DropdownController dropdownController = Get.put(DropdownController());
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                  title: controller.headTitle.value,
                  everythingButton: true,
                  onTap: () {
                    controller.toggleNewsMode();
                  },
                  trailingWidget: Visibility(
                    visible: controller.shouldShowHomeCountryChips(),
                    child: HomeCountryChip(
                      onCountryButtonClick: controller.routeToCountryView,
                      shortName: country.code,
                      flagPath: country.flagPath,
                    ),
                  ),
                );
              }),

              Container(
                width: Get.width,
                height: Get.height * 0.05,
                padding: EdgeInsets.symmetric(horizontal: kPadding * 2),
                child: Obx(() {
                  return Visibility(
                    replacement: SearchBox(controller: controller),
                    visible: controller.shouldShowCategoryChips(),
                    child: HomeHorizontalCategory(controller: controller),
                  );
                }),
              ),

              SizedBox(
                height: kHeight * 2,
              ),

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
                    child: Visibility(
                      replacement: ListView.separated(
                        itemBuilder: (context, index) {
                          final imageUrl = controller.articles[index].urlImg;
                          final author = controller.articles[index].author;
                          final title = controller.articles[index].title;
                          final desc = controller.articles[index].desc;
                          final publishedAt =
                              controller.articles[index].publishedAt;
                          final url = controller.articles[index].url ??
                              "https://www.google.com";

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
                      visible: controller.articles.isEmpty,
                      child: Text(
                        "No Data found. Try again",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
