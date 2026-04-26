import 'package:advanced_store_project/core/networking/api_constants.dart';
import 'package:advanced_store_project/core/networking/api_error_handler.dart';
import 'package:advanced_store_project/core/networking/api_error_model.dart';
import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/core/networking/api_services.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/model/sign_up_request_data.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/model/sign_up_response.dart';
import 'dart:async';

class SignupRepo {
  final ApiServices _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signup(
    SignUpRequestData signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      final Map<String, dynamic> responseData = response as Map<String, dynamic>;
      
      // Check the actual status from the API response
      bool apiStatus = responseData['status'] ?? false;
      String message = responseData['message'] ?? "Unknown error occurred";
      
      if (apiStatus) {
        // Success case - user registered successfully
        final signUpResponse = SignUpResponse(
          message: message,
          status: true,
          userData: responseData['userData'] ?? responseData,
        );
        
        return ApiResult.success(signUpResponse);
      } else {
        // Failure case - handle duplicate email or other errors
        print('Error: $message');
        
        // Create an error model for the failure case
        final errorModel = ApiErrorModel(
          message: message,
        );
        
        return ApiResult.failure(errorModel);
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
    }
  }
}