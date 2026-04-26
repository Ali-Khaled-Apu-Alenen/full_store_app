import 'package:advanced_store_project/core/networking/api_error_model.dart';
import 'package:advanced_store_project/core/networking/api_result.dart';
import 'package:advanced_store_project/core/networking/api_services.dart';
import 'package:advanced_store_project/ui/auth/login/logic/model/login_request_date.dart';
import 'package:advanced_store_project/ui/auth/login/logic/model/login_respose_data.dart';

class LoginRepo {
  final ApiServices _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponseData>> login(
    LoginRequestData loginRequestData,
  ) async {
    try {
      final response = await _apiService.login(loginRequestData);
      final Map<String, dynamic> responseData = response as Map<String, dynamic>;
      
      // Debug logging
      // print("API Response: $responseData");
      
      try {
        final loginRespose = LoginResponseData.fromJson(responseData);
        
        // Debug logging
        print("Parsed LoginResponse: status=${loginRespose.status}, userData=${loginRespose.userData}");
        if (loginRespose.userData != null) {
          print("UserData details: email=${loginRespose.userData!.usersEmail}, approve=${loginRespose.userData!.usersApprove}, id=${loginRespose.userData!.usersId}");
        }
        
        // Check status from the parsed model
        if (loginRespose.status == "success") {
          // Validate that we have the required data
          if (loginRespose.userData == null) {
            return ApiResult.failure(ApiErrorModel(message: "Invalid response from server - missing userData"));
          }
          if (loginRespose.userData!.usersEmail == null) {
            return ApiResult.failure(ApiErrorModel(message: "Invalid response from server - missing user email"));
          }
          return ApiResult.success(loginRespose);
        } else {
          // Extract message from original response for error cases
          String message = responseData["message"] ?? "Login failed";
          return ApiResult.failure(ApiErrorModel(message: message));
        }
      } catch (e) {
        print("JSON parsing error: $e");
        return ApiResult.failure(ApiErrorModel(message: "Failed to parse login response: ${e.toString()}"));
      }
    } catch (e) {
      print("API call error: $e");
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
