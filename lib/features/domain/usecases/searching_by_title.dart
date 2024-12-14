import '../../../core/helper/usecase.dart';
import '../../../features/domain/entites/search.dart';

import '../../../core/helper/either.dart';
import '../../domain/repositories/search_repository.dart';

class SearchingByTitle
    implements UseCase<Future<Either<Search, String>>, SearchingByTitleParams> {
  final SearchRepository repo;


  SearchingByTitle(this.repo);
@override
Future<Either<Search, String>> call(SearchingByTitleParams params) async{
    return repo.searchByTitle(
        params);
  }

}

class SearchingByTitleParams {
  final String s;
  final String y;
  final String type;
  final String page;

  @override
  String toString() {
    return 'SearchingByTitleParams{s: $s, y: $y, type: $type, page: $page}';
  }

  SearchingByTitleParams(
      {this.s = "", this.y = "", this.type = "", this.page = "1"});

  Map<String, String> toJson() {
    return {
      "s": s,

      "y": y,

      "type": type,
      "page": page
    };
  }
}
