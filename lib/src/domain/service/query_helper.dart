import 'package:dio/dio.dart';

class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required void Function(T) onResponse,
    required void Function(String) onError,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    if (e is DioException) {
      if (e.response != null) {
        return '${e.response?.data["message"]} ${e.response?.data["code"]}';
      }
      return e.toString();
    }
    return e.toString();
  }
}
