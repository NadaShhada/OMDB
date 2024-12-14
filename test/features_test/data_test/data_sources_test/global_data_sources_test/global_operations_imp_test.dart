import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/data/data-sourses/global_data_sources/global_operations_imp.dart';
import 'package:omdb/features/data/models/details_show_model.dart';
import 'package:omdb/features/data/models/search_model.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';
import 'package:omdb/features/domain/usecases/searching_by_title.dart';

void main() {
  group("Testing Global operations", () {
    test('Testing  global DetailsShow ', () async {
      Map<String, dynamic> json = {
        "Title": "GMod TTT",
        "Year": "2014–",
        "Rated": "N/A",
        "Released": "14 Jun 2014",
        "Runtime": "N/A",
        "Genre": "Comedy, Crime",
        "Director": "N/A",
        "Writer": "Lewis Brindley",
        "Actors": "Lewis Brindley, Ben Edgar, Duncan Jones",
        "Plot": "Various members of The Yogscast must weed out the traitors among them - before it's too late.",
        "Language": "English",
        "Country": "United Kingdom",
        "Awards": "N/A",
        "Poster": "https://m.media-amazon.com/images/M/MV5BOGZiNjMwMmYtOGQ4Yy00NTBhLWI3NjctMDYwMzVkOTM0NTA2XkEyXkFqcGdeQXVyNTI4MzI4NTQ@._V1_SX300.jpg",
        "Ratings": [
          {
            "Source": "Internet Movie Database",
            "Value": "9.4/10"
          }
        ],
        "Metascore": "N/A",
        "imdbRating": "9.4",
        "imdbVotes": "45",
        "imdbID": "tt11905274",
        "Type": "series",
        "totalSeasons": "8",
        "Response": "True"
      };
      DetailsShowModel model = DetailsShowModel.fromJson(json);
      GlobalOperationsImp global = GlobalOperationsImp();
      Map<String, dynamic> data =
          await global.getDetailsShow(SearchingByIdOrTitleParams(t:"ttt"));
      DetailsShowModel model2 = DetailsShowModel.fromJson(data);

      expect(model == model2, true);
    });
    test('Testing  global Search ', () async {
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
          {
            "Title": "Batman v Superman: Dawn of Justice",
            "Year": "2016",
            "imdbID": "tt2975590",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"
          },
          {
            "Title": "The Batman",
            "Year": "2022",
            "imdbID": "tt1877830",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg"
          },
          {
            "Title": "Batman",
            "Year": "1989",
            "imdbID": "tt0096895",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BZDNjOGNhN2UtNmNhMC00YjU4LWEzMmUtNzRkM2RjN2RiMjc5XkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg"
          },
          {
            "Title": "Batman Returns",
            "Year": "1992",
            "imdbID": "tt0103776",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BOGZmYzVkMmItM2NiOS00MDI3LWI4ZWQtMTg0YWZkODRkMmViXkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_SX300.jpg"
          },
          {
            "Title": "Batman & Robin",
            "Year": "1997",
            "imdbID": "tt0118688",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BMGQ5YTM1NmMtYmIxYy00N2VmLWJhZTYtN2EwYTY3MWFhOTczXkEyXkFqcGdeQXVyNTA2NTI0MTY@._V1_SX300.jpg"
          },
          {
            "Title": "Batman Forever",
            "Year": "1995",
            "imdbID": "tt0112462",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BNDdjYmFiYWEtYzBhZS00YTZkLWFlODgtY2I5MDE0NzZmMDljXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"
          },
          {
            "Title": "The Lego Batman Movie",
            "Year": "2017",
            "imdbID": "tt4116284",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg"
          },
          {
            "Title": "Batman: The Animated Series",
            "Year": "1992–1995",
            "imdbID": "tt0103359",
            "Type": "series",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BOTM3MTRkZjQtYjBkMy00YWE1LTkxOTQtNDQyNGY0YjYzNzAzXkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_SX300.jpg"
          },
          {
            "Title": "Batman v Superman: Dawn of Justice (Ultimate Edition)",
            "Year": "2016",
            "imdbID": "tt18689424",
            "Type": "movie",
            "Poster":
                "https://m.media-amazon.com/images/M/MV5BN2I4OTllM2MtMWVhNC00MjkzLWJlMDUtN2FhMGQ2ZGVjMjllXkEyXkFqcGdeQXVyMTEyNzgwMDUw._V1_SX300.jpg"
          }
        ],
        "totalResults": "526"
      };
      SearchModel model = SearchModel.fromJson(json);
      GlobalOperationsImp global = GlobalOperationsImp();
      Map<String, dynamic> data =
          await global.getSearch(SearchingByTitleParams(s: "batman"));
      SearchModel model2 = SearchModel.fromJson(data);

      expect(model == model2, true);
    });
  });
}
