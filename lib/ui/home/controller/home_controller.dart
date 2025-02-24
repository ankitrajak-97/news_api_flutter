import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/api/constants/api_constants.dart';
import 'package:news_api/api/model/article/article_response.dart';
import 'package:news_api/service/data_provider_service.dart';
import 'package:news_api/ui/country/model/country_model.dart';
import 'package:news_api/ui/country/view/country_view.dart';
import 'package:news_api/ui/home/view/sort_bottom_sheet.dart';
import 'package:news_api/utils/style/app_dimen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/api_adapter.dart';
import '../../../api/model/base/base_response.dart';
import '../constants/home_constants.dart';

class HomeController extends GetxController {
  final dataProvider = Get.find<DataProviderService>();
  final _name = "HomeController";
  final _api = ApiAdapter();
  final chipList = kChipList.obs;
  final sortList = kSortList.obs;
  final articles = <ArticleResponse>[].obs;

  final isLoading = true.obs;
  final headTitle = kPageTitle.first.obs;
  final searchQuery = ''.obs;
  final errorMsg = 'No Data found'.obs;
  final selectedChipText = ''.obs;
  final selectedSort = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    log("HeadTitle: ${dataProvider.getHeadTitle()}", name: _name);

    selectedChipText.value = chipList.first;
    selectedSort.value = sortList.first;

    headTitle.value = kPageTitle.first;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    log("controller onReady");

    // await fetchHeadlines();
    doApiCall();

    // to handle db operation or api calls only if required
  }

  // void doApiCall() {
  //   /// everything / headlines save and get
  //   /// in data provider class, there will be a variblable which one is the fetch (everything / headlines)
  //   /// dataprovier.thatvariablename.value
  //   /// if(dataprovier.thatvariablename.value = "everything"){
  //   ///   doFetchEverythingApiCall()
  //   /// } else {
  //   ///   doHeadlineApiCall()
  //   /// }
  // }

  void doApiCall() {
    headTitle.value = dataProvider.getHeadTitle();

    if (headTitle.value == kPageTitle.last) {
      errorMsg.value = "Please type something to search for";
      articles.clear();
      isLoading.value = false;
    } else {
      fetchHeadlines();
    }
  }

  void updateSort(String newSort) {
    selectedSort.value = newSort;
    fetchEverything(); // Fetch new sorted data
    Get.back(); // Close the bottom sheet
  }

  Future<void> _onUpdateCountry({required Country country}) async {
    dataProvider.selectedCountry.value = country;
    await fetchHeadlines();
  }

  // with this you can go to country view
  Future<void> routeToCountryView() async {
    var res = await Get.toNamed(CountryView.name) as Country;
    log("selected country: ${res.code}", name: _name);
    await dataProvider.saveCountry(countryCode: res.code);
    dataProvider.getCountry();
    _onUpdateCountry(country: res);
  }

  void toggleNewsMode() async {
    articles.clear();

    if (dataProvider.selectedHeadTitle.value == kPageTitle.first) {
      dataProvider.saveHeadTitle(kPageTitle.last); // Save new state
      headTitle.value = kPageTitle.last;
      errorMsg.value = "Please type something to search for";
    } else {
      dataProvider.saveHeadTitle(kPageTitle.first);
      headTitle.value = kPageTitle.first;
      errorMsg.value = "No Data found";
      fetchHeadlines();
    }
  }

  bool shouldShowCategoryChips() {
    return headTitle.value == kPageTitle.first;
  }

  bool shouldShowHomeCountryChips() {
    return headTitle.value == kPageTitle.first;
  }

  Future<void> updateSelectedChipListByName({required String selectedChip}) async {
    selectedChipText.value = selectedChip;
    await fetchHeadlines();
  }

  Future<void> updateSelectedChipListByIndex({required int index}) async {
    if (selectedChipText.value == chipList[index]) return;
    selectedChipText.value = chipList[index];
    chipList.refresh();
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
      "country": dataProvider.selectedCountry.value.code,
      "category": selectedChipText.value,
      "apiKey": kAPIKey,
    };
    var response = await _userRegistrationApiCallHeadlines(queryParams);
    if (response != null) {
      articles.assignAll(response.articleList);
      response.resultCount;
    }
    isLoading.value = false;
  }

  Future<void> fetchEverything() async {
    isLoading.value = true;
    final queryParams = {
      "q": searchQuery.value,
      "apiKey": kAPIKey,
      "sortBy": selectedSort.value,
    };

    var response = await _userRegistrationApiCallEverything(queryParams);
    if (response != null) {
      articles.assignAll(response.articleList);
      response.resultCount;
    }
    isLoading.value = false;
  }

  // Handle the API call only for headlines
  Future<BaseResponse?> _userRegistrationApiCallHeadlines(dynamic queryParams) async {
    BaseResponse? response;
    try {
      response = await _api.getHeadlines(params: queryParams);
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode ?? "NA"}", name: "Error", stackTrace: e.stackTrace);
      response = null;
    }
    return response;
  }

  // Handle the API call only for headlines
  Future<BaseResponse?> _userRegistrationApiCallEverything(dynamic queryParams) async {
    BaseResponse? response;
    try {
      response = await _api.getEverything(params: queryParams);
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode ?? "NA"}", name: "Error", stackTrace: e.stackTrace);
      response = null;
    }
    return response;
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(kRadius * 3)),
      ),
      builder: (context) => SortBottomSheet(
        controller: this,
      ),
    );
  }

  Future<void> updateSortAndFetch({required String selectedSort}) async {
    this.selectedSort.value = selectedSort;
    await fetchEverything();
  }
}
