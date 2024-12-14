import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/models/search_error_model.dart';
import 'package:collection/equality.dart';
void main() {
  test('Testing  search error model test', () {
    Map<String, dynamic> json = {
      "Response": "False",
      "Error": "Invalid API key!"
    };
SearchErrorModel model=SearchErrorModel.fromJson(json);
    Map<String, dynamic> newJson=model.toJson();
    expect(    const DeepCollectionEquality().equals(json , newJson), true);
  });
}