import 'package:get/get.dart';
import 'package:news_api/ui/country/model/country_model.dart';

class CountryController extends GetxController {
  var countryList = countries.obs; // Observable list

  void onSelectCountry({required int index}) {
    var selectedCountry = countryList[index];
    Get.back(result: selectedCountry);
  }
}
