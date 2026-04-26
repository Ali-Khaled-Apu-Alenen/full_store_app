

import 'package:advanced_store_project/core/constatnt/shared_pref_keys.dart';
import 'package:advanced_store_project/core/services/shared_preferences_helper.dart';
import 'package:dio/dio.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 10);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.sendTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
      // addDioHeaders();
      // addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzcwMzI3ODY5LCJleHAiOjE3NzA0MTQyNjksIm5iZiI6MTc3MDMyNzg2OSwianRpIjoiUVpaaDdvN3NoUFQzcHc5diIsInN1YiI6IjYzNDUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.hRUS5szsJFF7rSGY0r8zZ5PxgsVg0QtEesG-Svr_W4k',
      // TODO: Uncomment when SharedPrefHelper is implemented
      // 'Authorization':
      //     'Bearer ${await SharedPreferencesHelper.getString(SharedPrefKeys.)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    // dio?.interceptors.add(
      // PrettyDioLogger(
      //   requestBody: true,
      //   requestHeader: true,
      //   responseHeader: true,
      // ),
    // );
  }
}
