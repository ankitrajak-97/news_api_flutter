import 'package:dio/dio.dart';
import 'package:news_api/api/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'model/base/base_response.dart';
import 'service/retrofit_service.dart';

class ApiAdapter {
  ////////////////

  final _name = "ApiAdapter";

  // final baseOptions = BaseOptions(
  //   baseUrl: kBaseURL,
  //   contentType: Headers.jsonContentType,
  //   validateStatus: (int? status) {
  //     return status != null;
  //     // return status != null && status >= 200 && status < 300;
  //   },
  // );

  late RetrofitService _retrofitService;
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseURL,
      contentType: Headers.jsonContentType,
      validateStatus: (int? status) {
        return status != null;
        // return status != null && status >= 200 && status < 300;
      },
    ),
  );

  var token = '';
  // String? token;

  ApiAdapter() {
    if (isDebug) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: false,
          responseHeader: true,
        ),
      );
    }

    // dio.interceptors.add(CustomApiInterceptor());

    // timeout of api. How long the connect should hold
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    _retrofitService = RetrofitService(dio);
  }

  ///////////////

  /// get headlines
  Future<BaseResponse> getHeadlines({required dynamic params}) {
    return _retrofitService.getHeadlines(params);
  }

  
  /// get everything
  Future<BaseResponse> getEverything({required dynamic params}) {
    return _retrofitService.getEverything(params);
  }


}
