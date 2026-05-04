import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? code;
  final String message;
  final String? type;
  final dynamic details;
  final DateTime timestamp;

  ApiErrorModel({
    this.code,
    required this.message,
    this.type,
    this.details,
  }) : timestamp = DateTime.now();

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] as int?,
      message: json['message'] as String? ?? 'An unknown error occurred',
      type: json['type'] as String?,
      details: json['details'],
    );
  }

  factory ApiErrorModel.network({
    required String message,
    int? statusCode,
    dynamic details,
  }) {
    return ApiErrorModel(
      code: statusCode,
      message: message,
      type: 'network_error',
      details: details,
    );
  }

  factory ApiErrorModel.parsing({
    required String message,
    dynamic details,
  }) {
    return ApiErrorModel(
      message: message,
      type: 'parsing_error',
      details: details,
    );
  }

  factory ApiErrorModel.server({
    required String message,
    int? statusCode,
    dynamic details,
  }) {
    return ApiErrorModel(
      code: statusCode,
      message: message,
      type: 'server_error',
      details: details,
    );
  }

  factory ApiErrorModel.unknown({
    String? message,
    dynamic details,
  }) {
    return ApiErrorModel(
      message: message ?? 'An unknown error occurred',
      type: 'unknown_error',
      details: details,
    );
  }

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  @override
  String toString() {
    return 'ApiErrorModel(code: $code, message: $message, type: $type, timestamp: $timestamp)';
  }

  String get userFriendlyMessage {
    switch (type) {
      case 'network_error':
        return 'Network connection error. Please check your internet connection.';
      case 'parsing_error':
        return 'Data format error. Please try again.';
      case 'server_error':
        return 'Server error. Please try again later.';
      default:
        return message;
    }
  }
}
