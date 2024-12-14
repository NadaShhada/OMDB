import 'package:collection/equality.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/models/rating_model.dart';
void main() {
  test('Testing  rating  model test', () {
    Map<String, String> json = {
      "Source": "Internet Movie Database",
      "Value": "7.5/10"
    };
    RatingModel model=RatingModel.fromJson(json);
    Map<String, String> newJson=model.toJson();
    expect(    const DeepCollectionEquality().equals(json , newJson), true);
  });
}