import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/search_show.dart';

class SearchShowTest extends SearchShow {
  SearchShowTest(
      {required String title,
      required String year,
      required String imdbId,
      required String type,
      required String poster})
      : super(
            poster: poster,
            type: type,
            title: title,
            imdbId: imdbId,
            year: year);
}
void main() {
  test('Testing Show class en equality', () {

    SearchShowTest s1=SearchShowTest(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');
    SearchShowTest s2=SearchShowTest(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');

    expect(s1==s2, true);
  });
}