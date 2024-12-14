
import '../../../domain/usecases/searching_by_id_or_title.dart';
import '../../../domain/usecases/searching_by_title.dart';

abstract class GlobalOperations {
  static const String baseUrl = "http://omdbapi.com";
  static const String globalApi = "/";
  static const Map<String, String> apikey = {"apikey":"ba703c3"};

  Future<Map<String, dynamic>> getDetailsShow(
      SearchingByIdOrTitleParams params);

  Future<Map<String, dynamic>> getSearch(SearchingByTitleParams params);
}
