import 'package:advanced_store_project/core/networking/api_constants.dart';
import 'package:advanced_store_project/core/networking/parse_error_logger.dart';
import 'package:advanced_store_project/ui/auth/login/logic/model/login_request_date.dart';
import 'package:advanced_store_project/ui/auth/signup/logic/model/sign_up_request_data.dart';
import 'package:advanced_store_project/ui/auth/signup/verifycode/model/verify_code_request_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
    factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
    @POST(ApiConstants.signUp)
    Future<dynamic> signUp(@Body() SignUpRequestData data);
    @POST(ApiConstants.verifyCode)
    Future<dynamic> verifyCode(@Body() VerifyCodeRequestData data);
    @POST(ApiConstants.login)
    Future<dynamic> login(@Body() LoginRequestData data);
    @POST(ApiConstants.categories)
    @FormUrlEncoded()
    Future<String> getCategories();
    @POST(ApiConstants.items)
    Future<String> getItems();
}