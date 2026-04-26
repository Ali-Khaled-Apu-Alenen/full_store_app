import 'package:dio/dio.dart';

class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options, {Response? response}) {
    // Simple error logging - you can customize this as needed
    print('API Error: $error');
    print('Stack Trace: $stackTrace');
    print('Request Options: ${options.method} ${options.uri}');
    if (response != null) {
      print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');
    }
  }
}
