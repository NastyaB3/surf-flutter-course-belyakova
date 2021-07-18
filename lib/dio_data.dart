import 'package:dio/dio.dart';

final dio = Dio(baseOptions)
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
BaseOptions baseOptions = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  baseUrl: 'https://test-backend-flutter.surfstudio.ru',
  responseType: ResponseType.json,
);

