import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  
  print('Testing API endpoint...');
  
  try {
    // Test the categories endpoint
    final response = await dio.post(
      'http://alikhaledtest.whf.bz/shop_ecommerce/categories/categories.php',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        receiveTimeout: Duration(seconds: 5),
        sendTimeout: Duration(seconds: 5),
      ),
    );
    
    print('Response status: ${response.statusCode}');
    print('Response data type: ${response.data.runtimeType}');
    print('Response data: ${response.data}');
    
  } catch (e) {
    print('Error: $e');
    
    if (e is DioException) {
      print('DioException type: ${e.type}');
      print('DioException message: ${e.message}');
      print('Response status: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
    }
  }
}
