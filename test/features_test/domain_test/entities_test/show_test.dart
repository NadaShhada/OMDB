import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/show.dart';


class Test_Show extends Show {
  Test_Show(
      {required String title,
      required final String imdbId,
      required String type,
        required String year,
      required String poster}) : super (
            title: title,
            type: type,
            poster: poster,
            year: year,
            imdbId: imdbId);
}

void main() {
  test('Testing Show class en equality', () {
   Test_Show s1=Test_Show(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');
   Test_Show s2=Test_Show(title: 'Batman', imdbId: '1', type: 'movie', year: '1995', poster: 'image');

   expect(s1==s2, true);
  });
}
