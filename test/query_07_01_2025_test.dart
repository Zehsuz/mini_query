import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:query_07_01_2025/query_07_01_2025.dart';
import 'package:query_07_01_2025/src/data/models/AuthModel.dart';

QueryUseCase useCase = QueryUseCase();

Map<String, String> data = {
  'email': '${DateTime.now().microsecondsSinceEpoch}@gmail.com',
  'password': 'Passw0rd12',
};

void onResponse(dynamic obj, Type type) {
  stdout.writeln(obj.runtimeType);
  assert(obj.runtimeType == type);
}

void onError(String e) {
  fail(e);
}

void main() {
  group("testQuery", () {
    test('Signup', () async {
      await useCase.signup(
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
        email: data['email']!,
        password: data['password']!,
        passwordConfirm: data['password']!,
      );
    });
    // test('Login', () async {
    //   await useCase.login(
    //     onResponse: (obj) => onResponse(obj, AuthModel),
    //     onError: onError,
    //     email: data['email']!,
    //     password: data['password']!,
    //   );
    // });
  });
}
