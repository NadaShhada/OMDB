import 'package:flutter_test/flutter_test.dart';
import 'package:collection/equality.dart';
import 'package:omdb/features/data/models/search_model.dart';
void main() {
  test('Testing  search  model test', () {
    Map<String, dynamic> json = {"Search": [
      {"Title": "Batman Begins",
        "Year": "2005",
        "imdbID": "tt0372784",
        "Type": "movie",
        "Poster": "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
      },
    ],
      "totalResults": "526",
     };
    SearchModel model=SearchModel.fromJson(json);
    Map<String, dynamic> newJson=model.toJson();
    expect(    const DeepCollectionEquality().equals(json , newJson), true);
  });
}