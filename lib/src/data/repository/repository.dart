import 'package:query_07_01_2025/src/data/models/AuthModel.dart';
import 'package:query_07_01_2025/src/data/models/user_model.dart';

abstract class Repository {
  AuthModel? lastAuth;
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
});
  Future<AuthModel> login({
    required String email,
    required String password,
});
}