import 'package:ali_store/core/networking/api_constants.dart';
import 'package:ali_store/core/networking/parse_error_logger.dart';
import 'package:ali_store/data/model/items_request_data.dart';
import 'package:ali_store/data/model/set_favorite_request.dart';
import 'package:ali_store/ui/auth/login/logic/model/login_request_date.dart';
import 'package:ali_store/ui/auth/signup/logic/model/sign_up_request_data.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/verify_code_request_data.dart';
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
    Future<String> getItems(@Body() ItemsRequestData data);
    @POST(ApiConstants.setFavorite)
    Future<String> setFavorite(@Body() SetFavoriteRequest data);
}
