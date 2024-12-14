
import '../../../core/helper/either.dart';
import '../entites/details_show.dart';
import '../entites/search.dart';
import '../usecases/searching_by_id_or_title.dart';
import '../usecases/searching_by_title.dart';

abstract class SearchRepository {
  Future<Either<DetailsShow, String>> searchByIdOrTitle(
 SearchingByIdOrTitleParams params
  );

  Future<Either<Search, String>> searchByTitle(
    SearchingByTitleParams params
  );
}
