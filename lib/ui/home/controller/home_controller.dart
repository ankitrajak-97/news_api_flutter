import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_api/api/constants/api_constants.dart';
import 'package:news_api/api/model/article/article_response.dart';

import '../../../api/api_adapter.dart';
import '../../../api/model/base/base_response.dart';

class HomeController extends GetxController {
  final _api = ApiAdapter();
  final chipList = [
    'business',
    'entertainment',
    'health',
    'science',
    'general',
    'sports'
  ];

  final selectedChipText = ''.obs;

  final articles = <ArticleResponse>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    log("controller ${Get.height}");
    log("controller ${Get.width}");
    log("controller onInit");

    selectedChipText.value = chipList.first;

    // to handle local cache only
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    log("controller onReady");

    await fetchHeadlines();

    // to handle db operation or api calls only if required
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log("controller onClose");
  }

  Future<void> updateSelectedChipList({required String selectedChip}) async {
    selectedChipText.value = selectedChip;
    await fetchHeadlines();
  }

  Future<void> fetchHeadlines() async {
    isLoading.value = true;
    final queryParams = {
      "country": "us",
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
      log("Status Code: ${e.response?.statusCode ?? "NA"}",
          name: "Error", stackTrace: e.stackTrace);
      response = null;
    }
    return response;
  }
}
