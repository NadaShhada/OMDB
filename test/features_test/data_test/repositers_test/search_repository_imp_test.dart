import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/core/helper/either.dart';
import 'package:omdb/features/data/reposiories/search_repository_imp.dart';
import 'package:omdb/features/domain/entites/details_show.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';

void main() {
  group("Testing searchRepositoryImp ", () {
    test('Testing  Repository with data ', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "batman"));

      expect(result.data != null, true);
    });
    test('Testing  Repository without networking ', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "batman"));

      expect(result.error != null && result.error == "no internet connection",
          true);
    });

    test('Testing  Repository without autherization ', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "batman"));

      expect(
          result.error != null && result.error == "Unauthorized access", true);
    });
    test('Testing  Repository without access to the server ', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "batman"));

      expect(
          result.error != null &&
              result.error == "Failed connection to the server",
          true);
    });
    test('Testing  Repository  DetailsShow  with processing failed', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "batman"));
      print(result.error);
      expect(result.error != null && result.error == "Failed processing data",
          true);
    });
    test('Testing  Repository  DetailsShow  with model error', () async {
      SearchRepositoryImp repo = SearchRepositoryImp();
      Either<DetailsShow, String> result =
          await repo.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "ttttttt"));
print(result.error);
      expect(result.error != null , true);
    });
  });
}
