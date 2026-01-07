import 'package:dio/dio.dart';
import 'package:query_07_01_2025/query_07_01_2025.dart';
import 'package:query_07_01_2025/src/data/models/auth_model.dart';
import 'package:query_07_01_2025/src/data/storage/storage.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  @override
  AuthModel? lastAuth;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;
}
