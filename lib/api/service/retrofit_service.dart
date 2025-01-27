import 'dart:async';

import 'package:dio/dio.dart';
import 'package:news_api/api/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../model/base/base_response.dart';

part 'retrofit_service.g.dart';

// const tokenRequired = Extra({kAppendToken: true});

@RestApi(baseUrl: kBaseURL)
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  @GET(urlEverything)
  Future<BaseResponse> getEverything(@Queries() Map<String, dynamic> queryParams);

  @GET(urlHeadlines)
  Future<BaseResponse> getHeadlines(@Queries() Map<String, dynamic> queryParams);

  // /// User Social Login
  // @GET(path)(urlSocialLogin)
  // Future<BaseResponse> socialLogin(@Body() dynamic body);

  // /// User Social Login
  // @POST(urlEmailLogin)
  // Future<BaseResponse> emailLogin(@Body() dynamic body);

  // /// User Social Registration
  // @POST(urlSocialRegistration)
  // Future<BaseResponse> socialRegistration(@Body() dynamic body);

  // /// Onboard new device
  // @tokenRequired
  // @POST(urlAddDevice)
  // Future<BaseResponse> addDevice(@Body() dynamic body);

  // /// Onboard new component
  // @POST(urlAddComponent)
  // Future<BaseResponse> addComponent(@Body() dynamic body);

  // /// See inventory user list
  // @tokenRequired
  // @GET(urlInventoryUsers)
  // Future<BaseResponse> getInventoryUsers();

  // /// Get user profile
  // @tokenRequired
  // @GET(urlUserProfile)
  // Future<BaseResponse> getUserProfile();

  // /// approve user
  // @tokenRequired
  // @POST(urlApproveUser)
  // Future<BaseResponse> approveUser(@Body() dynamic body);

  // /// approve user
  // @tokenRequired
  // @POST(urlBlockUser)
  // Future<BaseResponse> blockUser(@Body() dynamic body);

  // /// approve user
  // @tokenRequired
  // @POST(urlUnblockUser)
  // Future<BaseResponse> unblockUser(@Body() dynamic body);

  // /// bulk dispatch
  // @tokenRequired
  // @POST(urlBulkDispatch)
  // Future<BaseResponse> bulkDispatch(@Body() dynamic body);
}
