import 'package:ali_store/core/networking/api_error_model.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/ui/auth/login/logic/model/login_request_date.dart';
import 'package:ali_store/ui/auth/login/logic/model/login_respose_data.dart';

class LoginRepo {
  final ApiServices _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponseData>> login(
    LoginRequestData loginRequestData,
  ) async {
    try {
      final response = await _apiService.login(loginRequestData);
      final Map<String, dynamic> responseData =
          response as Map<String, dynamic>;

      try {
        final loginRespose = LoginResponseData.fromJson(responseData);

        if (loginRespose.userData != null) {}

        if (loginRespose.status == "success") {
          if (loginRespose.userData == null) {
            return ApiResult.failure(
              ApiErrorModel(
                message: "Invalid response from server - missing userData",
              ),
            );
          }
          if (loginRespose.userData!.usersEmail == null) {
            return ApiResult.failure(
              ApiErrorModel(
                message: "Invalid response from server - missing user email",
              ),
            );
          }
          return ApiResult.success(loginRespose);
        } else {
          String message = responseData["message"] ?? "Login failed";
          return ApiResult.failure(ApiErrorModel(message: message));
        }
      } catch (e) {
        return ApiResult.failure(
          ApiErrorModel(
            message: "Failed to parse login response: ${e.toString()}",
          ),
        );
      }
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
