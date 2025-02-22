import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_api/shared_preference/shared_pref_key.dart';
import 'package:news_api/shared_preference/shared_prefs_helper.dart';
import 'package:news_api/ui/country/model/country_model.dart';

class DataProviderService extends GetxService {
  final _name = "DataProviderService";
  final pref = SharedPref();

  final selectedCountry = countries.first.obs; // Default selected country

  @override
  void onReady() async {
    log("Service Init", name: _name);
    super.onReady();
    await pref.init();

    getCountry();
  }

  //===============================
  // STORE AND RETRIVE SHARED PREF
  //===============================

  Future<bool> saveCountry({required String countryCode}) async {
    var res = await pref.setString(key: kPrefCountryCode, value: countryCode);
    log("country data save status: $res", name: _name);
    if (res) updateSelectedCountry(countryCode: countryCode);
    return res;
  }

  void getCountry() {
    var cCode = pref.getString(key: kPrefCountryCode);
    log("getContry : $cCode", name: _name);
    updateSelectedCountry(countryCode: cCode);
  }

  //===============================
  //  COUNTRY UPDATE PART
  //===============================

  void updateSelectedCountry({required String? countryCode}) {
    var country = countries.firstWhere((country) {
      return country.code == countryCode;
    }, orElse: () => countries.first);

    // set the value to obs
    selectedCountry.value = country;
  }

  //==================================
  // TOP HEADLINES OR EVERYTHING PART
  //==================================
}
