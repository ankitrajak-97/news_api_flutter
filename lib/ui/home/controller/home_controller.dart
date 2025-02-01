import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_api/api/constants/api_constants.dart';
import 'package:news_api/api/model/article/article_response.dart';
import 'package:news_api/ui/country/model/country_model.dart';
import 'package:news_api/ui/country/view/country_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/api_adapter.dart';
import '../../../api/model/base/base_response.dart';

class HomeController extends GetxController {
  final _api = ApiAdapter();
  final chipList = ['business', 'entertainment', 'health', 'science', 'general', 'sports'];

  final selectedChipText = ''.obs;
  var selectedCountry = countries.first.obs; // Default selected country

  final articles = <ArticleResponse>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    selectedChipText.value = chipList.first;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    log("controller onReady");

    await fetchHeadlines();

    // to handle db operation or api calls only if required
  }

  Future<void> _onUpdateCountry({required Country country}) async {
    selectedCountry.value = country;
    await fetchHeadlines();
  }

  // with this you can go to country view
  Future<void> routeToCountryView() async {
    var res = await Get.toNamed(CountryView.name) as Country;
    print(res);
    _onUpdateCountry(country: res);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log("controller onClose");
  }

  Future<void> updateSelectedChipListByName({required String selectedChip}) async {
    selectedChipText.value = selectedChip;
    await fetchHeadlines();
  }

  Future<void> updateSelectedChipListByIndex({required int index}) async {
    selectedChipText.value = chipList[index];
    await fetchHeadlines();
  }

  Future<void> launchInBrowser({required String url}) async {
    final link = Uri.parse(url);
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $url');
    }
  }

  // alternate way of the above
  Future<void> launchInBrowserByIndex({required int index}) async {
    var url = articles[index].url ?? "https://www.google.com";
    final link = Uri.parse(url);
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> fetchHeadlines() async {
    isLoading.value = true;
    final queryParams = {
      "country": selectedCountry.value.code,
      "category": selectedChipText.value,
      "apiKey": kAPIKey,
    };
    var response = await _userRegistrationApiCall(queryParams);
    if (response != null) {
      articles.assignAll(response.articleList);
      response.resultCount;
    }
    isLoading.value = false;
  }

  Future<void> fetchEverything() async {
    isLoading.value = true;
    final queryParams = {
      // "country": "us",
      // "category": selectedChipText.value,
      "apiKey": kAPIKey,
    };
    var response = await _userRegistrationApiCall(queryParams);
    if (response != null) {
      articles.assignAll(response.articleList);
      response.resultCount;
    }
    isLoading.value = false;
  }

  // Handle the API call only
  Future<BaseResponse?> _userRegistrationApiCall(dynamic queryParams) async {
    BaseResponse? response;
    try {
      response = await _api.getHeadlines(params: queryParams);
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode ?? "NA"}", name: "Error", stackTrace: e.stackTrace);
      response = null;
    }
    return response;
  }
}
