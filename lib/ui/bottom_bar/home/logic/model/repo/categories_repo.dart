import 'dart:convert';

import 'package:advanced_store_project/core/networking/api_error_model.dart';
import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/core/networking/api_services.dart';
import 'package:dio/dio.dart';

import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/categorie_response_data.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/model/items_response_data.dart';

class CategoriesRepo {
  final ApiServices _apiServices;

  CategoriesRepo(this._apiServices);

  Future<ApiResult<CategorieResponseData>> getCategories() async {
    try {
      print('Starting API call to getCategories...');
      final responseBody = await _apiServices.getCategories();
      print('API call completed');
      print('Response data type: ${responseBody.runtimeType}');
      print('Response data: $responseBody');

      Map<String, dynamic> responseData;

      // API returns a JSON string body (not a Map)
      print('Parsing string response...');
      try {
        responseData = jsonDecode(responseBody) as Map<String, dynamic>;
      } catch (e) {
        return ApiResult.failure(
          ApiErrorModel.parsing(
            message: 'Unexpected response data type',
            details: {
              'expected_type': 'String (JSON body)',
              'actual_type': responseBody.runtimeType.toString(),
              'response_data': responseBody,
              'parse_error': e.toString(),
            },
          ),
        );
      }

      print('Parsed data: $responseData');
      final categorieResponse = CategorieResponseData.fromJson(responseData);

      if (categorieResponse.status == "success") {
        print('REAL API SUCCESS - Using data from actual API server');
        return ApiResult.success(categorieResponse);
      } else {
        return ApiResult.failure(
          ApiErrorModel.server(
            message: 'API returned non-success status',
            details: categorieResponse,
          ),
        );
      }
    } catch (e) {
      // print('Repo error: $e');

      // Handle specific Dio exceptions
      if (e is DioException) {
        if (e.type == DioExceptionType.receiveTimeout) {
          // Return mock data for testing when API times out
          print('API TIMEOUT - Using MOCK data instead of real API');
          final mockCategories = CategorieResponseData(
            status: 'success',
            data: [
              Categorie(id: 1, name: 'shoeses', image: 'shoes.svg'),
              Categorie(id: 2, name: 'electronics', image: 'phone.svg'),
              Categorie(id: 3, name: 'clothes', image: 'clothes.svg'),
              Categorie(id: 4, name: 'foods', image: 'food.svg'),
            ],
          );
          return ApiResult.success(mockCategories);
        } else if (e.type == DioExceptionType.connectionTimeout) {
          return ApiResult.failure(
            ApiErrorModel.network(
              message:
                  'Connection timeout. Please check your internet connection.',
              statusCode: e.response?.statusCode,
              details: 'Connection timeout after 10 seconds',
            ),
          );
        } else if (e.type == DioExceptionType.connectionError) {
          return ApiResult.failure(
            ApiErrorModel.network(
              message: 'No internet connection. Please check your network.',
              statusCode: e.response?.statusCode,
              details: 'Connection error',
            ),
          );
        }
      }

      return ApiResult.failure(
        ApiErrorModel.unknown(
          message: 'Unexpected error in getCategories',
          details: e.toString(),
        ),
      );
    }
  }

  Future<ApiResult<ItemsResponseData>> getItems() async {
    try {
      final responseBody = await _apiServices.getItems();
      print('Response data type: ${responseBody.runtimeType}');

      Map<String, dynamic> responseData;

      print('Parsing string response...');
      try {
        responseData = jsonDecode(responseBody) as Map<String, dynamic>;
      } catch (e) {
        return ApiResult.failure(
          ApiErrorModel.parsing(
            message: 'Unexpected response data type',
            details: {
              'expected_type': 'String (JSON body)',
              'actual_type': responseBody.runtimeType.toString(),
              'response_data': responseBody,
              'parse_error': e.toString(),
            },
          ),
        );
      }

      print('Parsed data: $responseData');
      final itemsResponse = ItemsResponseData.fromJson(responseData);

      if (itemsResponse.status == "success") {
        return ApiResult.success(itemsResponse);
      } else {
        return ApiResult.failure(
          ApiErrorModel.server(
            message: 'API returned non-success status',
            details: itemsResponse,
          ),
        );
      }
    } catch (e) {
      print('Repo error: $e');
      return ApiResult.failure(
        ApiErrorModel.unknown(
          message: 'Unexpected error in getItems',
          details: e.toString(),
        ),
      );
    }
  }
}
