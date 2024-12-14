import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/core/helper/either.dart';
import '../../../../lib/features/domain/entites/details_show.dart';
import '../../../../lib/features/domain/entites/search.dart';
import '../../../../lib/features/domain/repositories/search_repository.dart';
import '../../../../lib/features/domain/usecases/searching_by_id_or_title.dart';
import '../../../../lib/features/domain/usecases/searching_by_title.dart';
import '../entities_test/details_show_test.dart';
import '../entities_test/rating_test.dart';
import '../entities_test/ratings_test.dart';
import '../entities_test/search_show_test.dart';
import '../entities_test/search_shows_test.dart';
import '../entities_test/search_test.dart';

class SearchRepositoryTest implements SearchRepository {
  @override
  Future<Either<DetailsShow, String>> searchByIdOrTitle(
      SearchingByIdOrTitleParams params) async{
    if (params.t == "Batman") {
      return Either(
          data: DetailsShowTest(
              title: 'Batman',
              imdbId: '1',
              type: 'movie',
              year: '1995',
              poster: 'image',
              rated: 'd',
              releases: 'cv',
              runtime: 'runtime',
              genre: 'genre',
              director: 'director',
              writer: 'writer',
              actors: 'actors',
              plot: 'plot',
              language: 'language',
              country: 'country',
              awards: 'awards',
              ratings: RatingsTest(ratings: [
                RatingTest(source: 'a', value: 'f'),
                RatingTest(source: 'a', value: 'f')
              ]),
              metaScore: 'metascore',
              imdbRating: 'imdbRating',
              imdbVotes: 'imdbVotes',
              dvd: 'dvd',
              boxOffice: 'boxOffice',
              production: 'production',
              website: 'website',response: "g"));
    } else {
      return Either(error: "data missing");
    }
  }

  @override
  Future<Either<Search, String>> searchByTitle(SearchingByTitleParams params
      ) async{
    if (params.s == "Batman") {
      return Either(
          data: SearchTest(
              shows: SearchShowsTest(shows: [
                SearchShowTest(
                    title: 'Batman',
                    imdbId: '1',
                    type: 'movie',
                    year: '1995',
                    poster: 'image')
              ]),
              totalResult: '4'));
    } else {
      return Either(error: "data missing");
    }
  }
}

void main() {
  group("Repository Test",()
  {
    test('Testing search_Repository_test class en equality', () async{
      SearchRepositoryTest s1 = SearchRepositoryTest();
    Either<DetailsShow, String> r = await  s1.searchByIdOrTitle( SearchingByIdOrTitleParams(t: "Batman"));
      Either<DetailsShow, String> r1 =await s1.searchByIdOrTitle(SearchingByIdOrTitleParams(t: "Bat"));

      expect(r.data != null && r1.error != null, true);
    });
    test('Testing search_Repository_test class en equality', () async{
      SearchRepositoryTest s1 = SearchRepositoryTest();
     Either<Search, String> r = await s1.searchByTitle( SearchingByTitleParams(s: "Batman"));
      Either<Search, String> r1 = await s1.searchByTitle(SearchingByTitleParams(s:"Bat"));

      expect(r.data != null && r1.error != null, true);
    });
  });
}
