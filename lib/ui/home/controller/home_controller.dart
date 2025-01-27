import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_api/api/constants/api_constants.dart';

import '../../../api/api_adapter.dart';
import '../../../api/model/base/base_response.dart';

class HomeController extends GetxController {
  final _api = ApiAdapter();
  @override
  void onInit() {
    super.onInit();
    log("controller onInit");
    // to handle local cache only
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    log("controller onReady");
    await fetchHeeadlines();
    // to handle db operation or api calls only if required
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log("controller onClose");
  }

  Future<void> fetchHeeadlines() async {
    final queryParams = {"country": "us", "apiKey": kAPIKey};

    var response = await _userRegistrationApiCall(queryParams);
    print(response?.toJson());
  }

  // Handle the API call only
  Future<BaseResponse?> _userRegistrationApiCall(dynamic queryParams) async {
    BaseResponse? response;
    try {
      response = await _api.getHeadlines(params: queryParams);
    } on DioException catch (e) {
      log("Error", stackTrace: e.stackTrace);
      response = null;
    }
    return response;
  }

  Future<void> fetchEverything() async {}
}
