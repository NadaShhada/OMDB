import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/core/services/http_conection.dart';
import 'package:omdb/features/data/data-sourses/global_data_sources/global_operations.dart';
import 'package:omdb/features/data/models/details_show_model.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';

void main() {
  test('Testing HttpConection service ', () async {
    Map<String, dynamic> json = {
      "Title": "Batman",
      "Year": "1989",
      "Rated": "PG-13",
      "Released": "23 Jun 1989",
      "Runtime": "126 min",
      "Genre": "Action, Adventure",
      "Director": "Tim Burton",
      "Writer": "Bob Kane, Sam Hamm, Warren Skaaren",
      "Actors": "Michael Keaton, Jack Nicholson, Kim Basinger",
      "Plot":
          "The Dark Knight of Gotham City begins his war on crime with his first major enemy being Jack Napier, a criminal who becomes the clownishly homicidal Joker.",
      "Language": "English, French, Spanish",
      "Country": "United States, United Kingdom",
      "Awards": "Won 1 Oscar. 10 wins & 26 nominations total",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BZDNjOGNhN2UtNmNhMC00YjU4LWEzMmUtNzRkM2RjN2RiMjc5XkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg",
      "Ratings": [
        {"Source": "Internet Movie Database", "Value": "7.5/10"},
        {"Source": "Rotten Tomatoes", "Value": "73%"},
        {"Source": "Metacritic", "Value": "69/100"}
      ],
      "Metascore": "69",
      "imdbRating": "7.5",
      "imdbVotes": "383,053",
      "imdbID": "tt0096895",
      "Type": "movie",
      "DVD": "22 Aug 1997",
      "BoxOffice": "\$251,409,241",
      "Production": "N/A",
      "Website": "N/A",
      "Response": "True"
    };
    HttpConnection httpConnection =
        HttpConnection.getInstance(GlobalOperations.baseUrl);
    Response result = await httpConnection.get(GlobalOperations.globalApi,
        queryParameters: {}..addAll(GlobalOperations.apikey)
          ..addAll(SearchingByIdOrTitleParams(t: "Batman").toJson()));
    DetailsShowModel model = DetailsShowModel.fromJson(result.data);
    DetailsShowModel model2 = DetailsShowModel.fromJson(json);

    print(model.toJson());
    expect(model == model2, true);
  });
}
