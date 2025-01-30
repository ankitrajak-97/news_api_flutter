import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/ui/country/controller/country_controller.dart';

import '../../../utils/style/app_color.dart';

class CountryView extends StatelessWidget {
  // this name string should be unique. otherwise app may not work properly
  static const name = '/country';
  const CountryView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller =  Get.lazyPut<SplashController>(() => SplashController());
    final controller = Get.put(CountryController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 0.0,
      ),
      backgroundColor: kBackgroundColor,
      body: Container(),
    );
  }
}

/// select country heading
/// bind country list in the country page
/// (flag_icon) (Name of the country) {short form}
/// List item eer click event
/// Use listView and listTile
/// leading (flag) Title(country name) subtitle(short name) onTap
