import 'dart:developer';

import 'package:dio/dio.dart';

import '../interceptor/interceptor.dart';
import '../result.dart';



class ApiClient {
  ApiClient({required this.interceptor}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.11.73:8888/api/v1",
        validateStatus: (status) => true,
      ),
    )..interceptors.add(interceptor);
  }

  final AuthInterceptor interceptor;
  late final Dio _dio;

  Future<Result<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      log("Request ketdi");
      var response = await _dio.get(path, queryParameters: queryParams);
      log("Response keldi");

      if (response.statusCode! <= 200 && response.statusCode! > 300) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    }

    on Exception catch (exception) {
      log("ERROR: $exception");
      return Result.error(exception);
    }
  }

  Future<Result> post(String path, {required Map<String, dynamic> data}) async {
    try {
      print("Get $path");
      var response = await _dio.post(path, data: data);
      print("Status: ${response.statusCode}");
      print("response: ${response.data}");

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
