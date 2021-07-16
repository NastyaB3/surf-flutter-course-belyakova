import 'package:dio/dio.dart';

final dio = Dio(baseOptions)
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
BaseOptions baseOptions = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  baseUrl: 'https://jsonplaceholder.typicode.com',
  responseType: ResponseType.json,
);

Future<String> getPlaces() async {
  final response = await dio.get('/users');
  if (response.statusCode == 200) {
    return response.data.toString();
  }
  throw Exception("Error code : ${response.statusCode}");
}
