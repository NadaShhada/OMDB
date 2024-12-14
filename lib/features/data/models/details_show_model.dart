

import '../../domain/entites/details_show.dart';
import '../../domain/entites/ratings.dart';
import 'ratings_model.dart';

class DetailsShowModel extends DetailsShow {
  DetailsShowModel(
      {required String title,
      required String year,
      required String imdbId,
      required String type,
      required String poster,
      required String rated,
      required String releases,
      required String runtime,
      required String genre,
      required String director,
      required String writer,
      required String actors,
      required String plot,
      required String language,
      required String country,
      required String awards,
      required Ratings ratings,
      required String metaScore,
      required String imdbRating,
      required String imdbVotes,
      required String? dvd,
      required String? boxOffice,
      required String? production,
      required String? website
      ,required String response})
      : super(
      releases: releases,
            rated: rated,
            runtime: runtime,
            genre: genre,
            director: director,
            writer: writer,
            actors: actors,
            plot: plot,
            language: language,
            country: country,
            awards: awards,
            ratings: ratings,
            metaScore: metaScore,
            imdbRating: imdbRating,
            imdbVotes: imdbVotes,
            dvd: dvd,
            boxOffice: boxOffice,
            production: production,
            website: website,
            imdbId: imdbId,
            type: type,
            title: title,
            poster: poster,
            year: year,response: response);

  factory DetailsShowModel.fromJson(Map<String, dynamic> json) {
    return DetailsShowModel(
        rated: json["Rated"]!,
        releases: json["Released"]!,
        runtime: json["Runtime"]!,
        genre: json["Genre"]!,
        director: json["Director"]!,
        writer: json["Writer"]!,
        actors: json["Actors"]!,
        plot: json["Plot"]!,
        language: json["Language"]!,
        country: json["Country"]!,
        awards: json["Awards"]!,
        ratings: RatingsModel.fromJson(json["Ratings"])!,
        metaScore: json[ "Metascore"]!,
        imdbRating: json["imdbRating"]!,
        imdbVotes: json["imdbVotes"]!,
        dvd: json["DVD"],
        boxOffice: json["BoxOffice"],
        production: json["Production"],
        website: json["Website"],
        imdbId: json["imdbID"]!,
        type: json["Type"]!,
        title: json["Title"]!,
        poster: json["Poster"]!,
        year: json["Year"]!,
    response: json["Response"]!);
  }

  Map<String, dynamic> toJson(){return{"Rated":rated,
  "Released":releases,
  "Runtime":runtime,
  "Genre":genre,
  "Director":director,
 "Writer":writer,
  "Actors":actors,
  "Plot":plot,
  "Language":language,
  "Country":country,
  "Awards":awards,
  "Ratings":(ratings as RatingsModel).toJson(),
 "Metascore":metaScore,
 "imdbRating":imdbRating,
"imdbVotes":imdbVotes,
  "DVD":dvd,
  "BoxOffice":boxOffice,
"Production":production,
 "Website":website,
"imdbID":imdbId,
  "Type":type,
 "Title":title,
  "Poster":poster,
  "Year":year,
  "Response":response};


  }
}
