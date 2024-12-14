import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/search_shows.dart';

import 'search_show_test.dart';

class SearchShowsTest extends SearchShows{
  SearchShowsTest({  required List<SearchShowTest> shows}) :super(shows);
}
void main() {
  test('Testing Show class en equality', () {
    SearchShowTest t=SearchShowTest(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');

    SearchShowsTest s1=SearchShowsTest(shows:[t]);
    SearchShowsTest s2=SearchShowsTest(shows:[t]);

    expect(s1==s2, true);
  });
}