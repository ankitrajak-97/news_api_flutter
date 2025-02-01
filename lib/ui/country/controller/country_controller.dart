import 'package:get/get.dart';
import 'package:news_api/ui/country/model/country_model.dart';

class CountryController extends GetxController {
  final countryLists = [
    "India",
    "United States",
    "Canada",
    "United Kingdom",
    'Brazil'
  ];
  final countryCodeList = ['IND', 'US', 'CAN', 'UK', 'BRA'];
  final flagPathList = [
    "assets/svg/ic_india.svg",
    "assets/svg/ic_usa.svg",
    "assets/svg/ic_canada.svg",
    "assets/svg/ic_uk.svg",
    "assets/svg/ic_brazil.svg"
  ];
  var countryList = countries.obs; // Observable list
  var selectedCountry = countries.first.obs; // Default selected country
  void updateSelectedCountry(Country country) {
    selectedCountry.value = country;
  }
}
