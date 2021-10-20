import 'dart:io';

import 'package:dio/dio.dart';

import 'models/news.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://616abe9c16e7120017fa1098.mockapi.io',
    ),
  );
  Dio get dio => _dio;
}