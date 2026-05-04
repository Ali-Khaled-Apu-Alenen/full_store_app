import 'package:ali_store/core/networking/api_constants.dart';
import 'package:ali_store/core/networking/api_error_handler.dart';
import 'package:ali_store/core/networking/api_error_model.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/ui/auth/signup/logic/model/sign_up_request_data.dart';
import 'package:ali_store/ui/auth/signup/logic/model/sign_up_response.dart';
import 'dart:async';

class SignupRepo {
  final ApiServices _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signup(
    SignUpRequestData signupRequestBody,
  ) async {
    try {
      print('1. Making API call...');
      final response = await _apiService.signUp(signupRequestBody);
      print('2. Raw API response: $response');
      
      final Map<String, dynamic> responseData = response as Map<String, dynamic>;
      print('3. Parsed response data: $responseData');
      
      // Check the actual status from the API response
      bool apiStatus = responseData['status'] ?? false;
      String message = responseData['message'] ?? "Unknown error occurred";
      int? statusCode = responseData['code'];
      
      print('4. API Status: $apiStatus');
      print('5. Message: $message');
      print('6. Status Code: $statusCode');
      
      if (apiStatus) {
        // Success case - user registered successfully
        print('7. Creating success response...');
        final signUpResponse = SignUpResponse.fromJson(responseData);
        print('8. Success response created: ${signUpResponse.message}');
        
        return ApiResult.success(signUpResponse);
      } else {
        // Failure case - handle duplicate email or other errors
        print('9. API returned failure - Message: $message');
        
        // Create an error model for the failure case
        final errorModel = ApiErrorModel(
          message: message,
          code: statusCode,
          type: 'api_error',
        );
        
        return ApiResult.failure(errorModel);
      }
    } catch (error) {
      print('10. Exception caught: $error');
      print('11. Error type: ${error.runtimeType}');
      
      final handledError = ErrorHandler.handle(error);
      print('12. Handled error: ${handledError.apiErrorModel}');
      
      return ApiResult.failure(handledError.apiErrorModel);
    }
  }
}
