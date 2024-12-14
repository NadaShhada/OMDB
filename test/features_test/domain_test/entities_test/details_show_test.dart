

import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/details_show.dart';
import 'package:omdb/features/domain/entites/ratings.dart';

import 'rating_test.dart';
import 'ratings_test.dart';

class DetailsShowTest extends DetailsShow {
  DetailsShowTest({
    required String title,
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
    required String? website,
  required String response}) : super(
      rated: rated,
      releases: releases,
      runtime: runtime,
      genre: genre,
      director: director,
      writer: writer,
      actors: actors,
      plot: plot
      ,
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
      website: website,imdbId: imdbId,type: type,title: title,poster: poster,year: year,response: response);

}


void main() {
  test('Testing DetailShow class en equality', () {
    RatingTest h= RatingTest(source:'a',value:'f');
    RatingsTest u=RatingsTest(ratings:[h,h]);

    DetailsShowTest s1 = DetailsShowTest(title: 'Batman',
        imdbId: '1',
        type: 'movie',
        year: '1995',
        poster: 'image', rated: 'd',
        releases: 'cv',
        runtime: 'runtime',
        genre: 'genre',
        director: 'director',
        writer: 'writer',
        actors: 'actors',
        plot: 'plot'
        ,
        language: 'language',
        country: 'country',
        awards: 'awards',
        ratings:u ,
        metaScore: 'metascore',
        imdbRating: 'imdbRating',
        imdbVotes: 'imdbVotes',
        dvd: 'dvd',
        boxOffice: 'boxOffice',
        production: 'production',
        website: 'website',response: "True");
    DetailsShowTest s2 = DetailsShowTest(title: 'Batman',
        imdbId: '1',
        type: 'movie',
        year: '1995',
        poster: 'image', rated: 'd',
        releases: 'cv',
        runtime: 'runtime',
        genre: 'genre',
        director: 'director',
        writer: 'writer',
        actors: 'actors',
        plot: 'plot'
        ,
        language: 'language',
        country: 'country',
        awards: 'awards',
        ratings:u ,
        metaScore: 'metascore',
        imdbRating: 'imdbRating',
        imdbVotes: 'imdbVotes',
        dvd: 'dvd',
        boxOffice: 'boxOffice',
        production: 'production',
        website: 'website',response: "True");

    expect(s1 == s2, true);
  });
}