
import 'package:advanced_store_project/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';
// part 'api_result.g.dart';

@freezed
class ApiResult<T> with _$ApiResult {

  
  factory ApiResult.success(T data) = ApiResultSuccess<T>;
  
  factory ApiResult.failure(ApiErrorModel error) = ApiResultFailure<T>;
}
