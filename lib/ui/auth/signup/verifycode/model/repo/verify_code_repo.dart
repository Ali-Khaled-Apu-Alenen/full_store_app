import 'package:ali_store/core/networking/api_error_model.dart';
import 'package:ali_store/core/networking/api_result.dart';
import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/verify_code_request_data.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/verify_code_response_data.dart';

class VerifyCodeRepo {
  final ApiServices _apiServices;
  VerifyCodeRepo(this._apiServices);
  Future <ApiResult<VerifyCodeResponseData>> verifyCode(
    VerifyCodeRequestData verifyCodeRequestData
  )async{
    try{
      final response=await _apiServices.verifyCode(verifyCodeRequestData);
      final Map<String, dynamic> responseData = response as Map<String, dynamic>;
      bool responseStatus=responseData["status"]??false;
      String responseMessage=responseData["message"]??"";

      if(responseStatus){
        return ApiResult.success(VerifyCodeResponseData.fromJson(responseData));
      }else{
        return ApiResult.failure(ApiErrorModel(message: responseMessage));
      }
    }catch(e){
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
