import '../../../core/helper/usecase.dart';
import '../../../core/helper/either.dart';
import '../../domain/entites/details_show.dart';
import '../../domain/repositories/search_repository.dart';

class SearchingByIdOrTitle
    implements UseCase<Future<Either<DetailsShow, String>>, SearchingByIdOrTitleParams> {
  final SearchRepository repo;

  SearchingByIdOrTitle(this.repo);
@override
 Future< Either<DetailsShow, String>>  call(
      SearchingByIdOrTitleParams params) async{
    return repo.searchByIdOrTitle(
        params);
  }
}

class SearchingByIdOrTitleParams {
  final String i;
  final String t;
  final String y;
  final String plot;
  final String type;


  @override
  String toString() {
    return 'SearchingByIdOrTitleParams{i: $i, t: $t, y: $y, plot: $plot, type: $type}';
  }

  SearchingByIdOrTitleParams(
      {this.i = "",
      this.t = "",
      this.y = "",
      this.plot = "short",
      this.type = ""});

  Map<String,String> toJson(){
    return {
      "i": i,
      "t": t,
      "y": y,
      "plot": plot,
      "type": type
    };
  }
}


