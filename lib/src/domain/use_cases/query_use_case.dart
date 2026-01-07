import 'package:dio/dio.dart';
import 'package:query_07_01_2025/query_07_01_2025.dart';

class QueryUseCase{
  final Client _client = Client(dio: Dio(), storage: Storage());
  final QueryHelper helper = QueryHelper();

}