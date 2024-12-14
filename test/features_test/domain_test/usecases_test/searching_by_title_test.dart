import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/core/helper/either.dart';
import 'package:omdb/features/domain/entites/search.dart';
import 'package:omdb/features/domain/usecases/searching_by_title.dart';

import '../reprository_test/search_repository_test.dart';

void main() {

  test('Testing  searchingByIdOrTitle test', () async{

    SearchRepositoryTest searchRepositoryTest=SearchRepositoryTest();
    SearchingByTitle searchingByIdOrTitle=SearchingByTitle(searchRepositoryTest);
    Either<Search,String> results1=await searchingByIdOrTitle.call(SearchingByTitleParams(s: "Batman"));
    Either<Search,String> results2=await searchingByIdOrTitle.call(SearchingByTitleParams(s: "Batm"));

    expect(results1.data != null && results2.error != null, true);
  });

}