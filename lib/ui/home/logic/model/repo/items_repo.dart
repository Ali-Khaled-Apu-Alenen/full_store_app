import 'package:advanced_store_project/core/networking/api_error_model.dart';
import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/core/networking/api_services.dart';
import 'package:advanced_store_project/ui/home/logic/model/items_response_data.dart';
import 'dart:convert';

class ItemsRepo {
  final ApiServices _apiServices;
  ItemsRepo(this._apiServices);
  Future<ApiResult<ItemsResponseData>> getItems() async {
    try {
      final responseBody = await _apiServices.getItems();

      final Map<String, dynamic> responseData = jsonDecode(responseBody) as Map<String, dynamic>;
      final itemsResponse = ItemsResponseData.fromJson(responseData);

      if (itemsResponse.status == "success") {
        return ApiResult.success(itemsResponse);
      }

      return ApiResult.failure(
        ApiErrorModel.server(
          message: 'API returned non-success status',
          details: itemsResponse,
        ),
      );
    } catch (e) {
      return ApiResult.failure(
        ApiErrorModel.parsing(
          message: e.toString(),
          details: {'source': 'ItemsRepo.getItems'},
        ),
      );
    }
  }
}
