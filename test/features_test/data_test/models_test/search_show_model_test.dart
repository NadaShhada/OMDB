import 'package:collection/equality.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/models/search_show_model.dart';
void main() {
  test('Testing  search show  model test', () {
    Map<String, String> json = {
      "Title": "The Lego Batman Movie",
      "Year": "2017",
      "imdbID": "tt4116284",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg"
    };
    SearchShowModel model=SearchShowModel.fromJson(json);
    Map<String, String> newJson=model.toJson();
    expect(    const DeepCollectionEquality().equals(json , newJson), true);
  });
}