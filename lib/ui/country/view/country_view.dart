import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:news_api/ui/country/controller/country_controller.dart';

import '../../../components/custom_appbar.dart';
import '../../../utils/style/app_color.dart';

class CountryView extends StatelessWidget {
  static const name = '/country';
  const CountryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryController()); // Initialize controller

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
            CustomAppBar(
              title: 'Select Country',
              showTrailing: false,
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.countryList.length,
                  itemBuilder: (context, index) {
                    final country =
                        controller.countryList[index]; // Fetch country object
                    return ListTile(
                      leading: SvgPicture.asset(
                        country.flagPath, // Display country flag
                        height: 40.h,
                        width: 40.w,
                      ),
                      title: Text(
                        country.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                      subtitle: Text(
                        country.code, // Display country short form
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        controller.onSelectCountry(index: index);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

/// select country heading
/// bind country list in the country page
/// (flag_icon) (Name of the country) {short form}
/// List item eer click event
/// Use listView and listTile
/// leading (flag) Title(country name) subtitle(short name) onTap
