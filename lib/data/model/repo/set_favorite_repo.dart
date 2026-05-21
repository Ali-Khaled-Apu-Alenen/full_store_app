import 'dart:convert';

import 'package:ali_store/core/networking/api_error_model.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/data/model/set_favorite_request.dart';
import 'package:ali_store/data/model/set_favorite_response.dart';

class SetFavoriteRepo {
  final ApiServices _apiServices;
  SetFavoriteRepo(this._apiServices);
  
  Future<ApiResult<SetFavoriteResponse>> setFavorite(
    final SetFavoriteRequest setFavoriteRequest,
  ) async {
    try {
      final responseBody = await _apiServices.setFavorite(setFavoriteRequest);
      final Map<String, dynamic> responseData =
          jsonDecode(responseBody) as Map<String, dynamic>;
      final setFavoriteResponse = SetFavoriteResponse.fromJson(responseData);
      if (setFavoriteResponse.status == "success") {
        return ApiResult.success(setFavoriteResponse);
      }
      return ApiResult.failure(
        ApiErrorModel(message: setFavoriteResponse.message),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel.parsing(
          message: e.toString(),
          details: {'source': 'SetFavoriteRepo.setFavorite'},
        ),
      );
    }
  }
}
