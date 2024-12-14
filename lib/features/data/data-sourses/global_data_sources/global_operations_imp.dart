import 'package:dio/dio.dart';

import '../../../../core/services/http_conection.dart';
import '../../../domain/usecases/searching_by_id_or_title.dart';
import '../../../domain/usecases/searching_by_title.dart';
import 'global_operations.dart';

class GlobalOperationsImp implements GlobalOperations {
  @override
  Future<Map<String, dynamic>> getDetailsShow(
      SearchingByIdOrTitleParams params) async {
    HttpConnection httpConnection =
    HttpConnection.getInstance(GlobalOperations.baseUrl);
    Response result = await httpConnection.get(GlobalOperations.globalApi,
        queryParameters: {}..addAll(GlobalOperations.apikey)..addAll(params.toJson()));
    return result.data;
  }

  @override
  Future<Map<String, dynamic>> getSearch(SearchingByTitleParams params) async {
    HttpConnection httpConnection =
        HttpConnection.getInstance(GlobalOperations.baseUrl);
    Response result = await httpConnection.get(GlobalOperations.globalApi,
        queryParameters: {}..addAll(GlobalOperations.apikey)..addAll(params.toJson()));
    return result.data;
  }
}
