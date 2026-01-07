import 'package:dio/dio.dart';
import 'package:query_07_01_2025/query_07_01_2025.dart';
import 'package:query_07_01_2025/src/data/models/AuthModel.dart';

class QueryUseCase {
  final Client _client = Client(dio: Dio(), storage: Storage());
  final QueryHelper _helper = QueryHelper();

  Future<void> signup({
    required void Function(UserModel) onResponse,
    required void Function(String) onError,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    await _helper.request(
      request: () => _client.signup(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required void Function(AuthModel) onResponse,
    required void Function(String) onError,
    required String email,
    required String password,
  }) async {
    await _helper.request(
      request: () => _client.login(
        email: email,
        password: password,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
