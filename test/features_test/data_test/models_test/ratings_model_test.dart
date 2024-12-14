import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/models/ratings_model.dart';
import 'package:collection/equality.dart';

void main() {
  test('Testing  ratings  model test', () {
    List<Map<String, String>> json =
      [
        {
          "Source": "Internet Movie Database",
          "Value": "7.5/10"
        },
        {
          "Source": "Rotten Tomatoes",
          "Value": "73%"
        },
        {
          "Source": "Metacritic",
          "Value": "69/100"
        }
      ]
    ;
    RatingsModel model=RatingsModel.fromJson(json);
    List<Map<String, String>> newJson=model.toJson();
    expect(    const DeepCollectionEquality().equals(json , newJson), true);
  });
}