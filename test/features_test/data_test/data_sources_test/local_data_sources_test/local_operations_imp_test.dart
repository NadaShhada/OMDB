import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/data-sourses/local_data_sources/local_operations_imp.dart';
import 'package:omdb/features/data/models/details_show_model.dart';
import 'package:omdb/features/data/models/search_model.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';
import 'package:omdb/features/domain/usecases/searching_by_title.dart';

void main() {
  group("testing local dataSources", () {
    test('Testing store and restore DetailsShowModel', () async {
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
        "imdbVotes": "381,476",
        "imdbID": "tt0096895",
        "Type": "movie",
        "DVD": "22 Aug 1997",
        "BoxOffice": "251,409,241",
        "Production": "N/A",
        "Website": "N/A",
        "Response": "True"
      };
      DetailsShowModel model = DetailsShowModel.fromJson(json);
      LocalOperationsImp localOperationsImp = LocalOperationsImp();
      await localOperationsImp.storeDetailsShowModel(
          SearchingByIdOrTitleParams(t: "Batman"), model);
      DetailsShowModel restoreModel = await localOperationsImp
              .restoreDetailsShowModel(SearchingByIdOrTitleParams(t: "Batman"))
          as DetailsShowModel;
      expect(model == restoreModel, true);
    });
    test('Testing store and restore SearchModel', () async {
      Map<String, dynamic> json = {
        "Search": [
          {
            "Title": "Batman Begins",
            "Year": "2005",
            "imdbID": "tt0372784",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
          },
        ],
        "totalResults": "526",
      };
      SearchModel model = SearchModel.fromJson(json);
      LocalOperationsImp localOperationsImp = LocalOperationsImp();
      await localOperationsImp.storeSearchModel(
          SearchingByTitleParams(s: "Batman"), model);
      SearchModel restoreModel = await localOperationsImp.restoreSearchModel(
          SearchingByTitleParams(s: "Batman")) as SearchModel;
      expect(model == restoreModel, true);
    });
  });
}
