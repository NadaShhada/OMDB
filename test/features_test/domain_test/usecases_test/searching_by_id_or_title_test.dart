import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/core/helper/either.dart';
import 'package:omdb/features/domain/entites/details_show.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';

import '../reprository_test/search_repository_test.dart';

void main() {

  test('Testing  searchingByIdOrTitle test', () async{

    SearchRepositoryTest searchRepositoryTest=SearchRepositoryTest();
    SearchingByIdOrTitle searchingByIdOrTitle=SearchingByIdOrTitle(searchRepositoryTest);
    Either<DetailsShow,String> results1=await searchingByIdOrTitle.call(SearchingByIdOrTitleParams(t: "Batman"));
    Either<DetailsShow,String> results2=await searchingByIdOrTitle.call(SearchingByIdOrTitleParams(t: "Batm"));

    expect(results1.data != null && results2.error != null, true);
  });

}