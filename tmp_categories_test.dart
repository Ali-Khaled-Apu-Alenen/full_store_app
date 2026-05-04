import 'package:dio/dio.dart';
import 'package:ali_store/core/networking/api_constants.dart';

void main() async {
  final dio = Dio();
  try {
    final response = await dio.post('${ApiConstants.baseUrl}${ApiConstants.categories}');
    print('status: ${response.statusCode}');
    print('data type: ${response.data.runtimeType}');
    print(response.data);
  } catch (e) {
    print('error: $e');
  }
}
