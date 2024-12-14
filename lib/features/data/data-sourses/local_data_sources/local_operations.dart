
import '../../../domain/entites/details_show.dart';
import '../../../domain/entites/search.dart';
import '../../../domain/usecases/searching_by_id_or_title.dart';
import '../../../domain/usecases/searching_by_title.dart';

abstract class LocalOperations {
  Future<void> storeDetailsShowModel
  (SearchingByIdOrTitleParams params,
      DetailsShow model);

  Future<DetailsShow?> restoreDetailsShowModel(SearchingByIdOrTitleParams params);

  Future<void> storeSearchModel(SearchingByTitleParams params, Search model);

  Future<Search?> restoreSearchModel(SearchingByTitleParams params);
}