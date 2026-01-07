import 'package:dio/dio.dart';
import 'package:query_07_01_2025/query_07_01_2025.dart';
import 'package:query_07_01_2025/src/data/models/AuthModel.dart';
import 'package:query_07_01_2025/src/data/models/user_model.dart';
import 'package:query_07_01_2025/src/data/storage/storage.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  @override
  AuthModel? lastAuth;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    Response response = await _dio.post(
      '${_storage.apiURL}/users/auth-with-password',
      data: {'email': email, 'password': password},
    );
    lastAuth = AuthModel.fromJSON(response.data);
    return lastAuth!;
  }

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    Response response = await _dio.post(
      '${_storage.apiURL}/users/records',
      data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      },
    );
    var data = UserModel.fromJSON(response.data);
    return data;
  }
}
