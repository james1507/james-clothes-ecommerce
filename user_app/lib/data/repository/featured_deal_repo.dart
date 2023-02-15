import 'package:flutter/material.dart';
import 'package:james_clothes_app/data/datasource/remote/dio/dio_client.dart';
import 'package:james_clothes_app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:james_clothes_app/data/model/response/base/api_response.dart';
import 'package:james_clothes_app/utill/app_constants.dart';

class FeaturedDealRepo {
  final DioClient dioClient;
  FeaturedDealRepo({@required this.dioClient});

  Future<ApiResponse> getFeaturedDeal() async {
    try {
      final response = await dioClient.get(AppConstants.FEATURED_DEAL_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
