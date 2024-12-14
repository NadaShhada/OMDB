import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/search.dart';
import 'package:omdb/features/domain/entites/search_shows.dart';

import 'search_show_test.dart';
import 'search_shows_test.dart';

class SearchTest extends Search{
  SearchTest( {required SearchShows shows,
    required String totalResult}): super(shows: shows,totalResult: totalResult);

}
void main() {
  test('Testing search_test class en equality', () {
    SearchShowTest t=SearchShowTest(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');

    SearchShowsTest h=SearchShowsTest(shows:[t]);

    SearchTest s1=SearchTest(shows:h ,totalResult: '4');
    SearchTest s2=SearchTest(shows:h ,totalResult: '4');

    expect(s1==s2, true);
  });
}