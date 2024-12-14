import 'ratings.dart';

import 'show.dart';

abstract class DetailsShow extends Show {
  final String rated;
  final String releases;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final Ratings ratings;
  final String metaScore;
  final String imdbRating;
  final String imdbVotes;
  final String? dvd;
  final String? boxOffice;
  final String? production;
  final String? website;
final String response;

  DetailsShow({
    required String title,
    required String year,
    required String imdbId,
    required String type,
    required String poster,
    required this.rated,
    required this.releases,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.ratings,
    required this.metaScore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response
  })
      : super(title: title,
      type: type,
      year: year,
      imdbId: imdbId,
      poster: poster);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is DetailsShow &&
          runtimeType == other.runtimeType &&
          rated == other.rated &&
          releases == other.releases &&
          runtime == other.runtime &&
          genre == other.genre &&
          director == other.director &&
          writer == other.writer &&
          actors == other.actors &&
          plot == other.plot &&
          language == other.language &&
          country == other.country &&
          awards == other.awards &&
          ratings == other.ratings &&
          metaScore == other.metaScore &&
          imdbRating == other.imdbRating &&
          imdbVotes == other.imdbVotes &&
          dvd == other.dvd &&
          boxOffice == other.boxOffice &&
          production == other.production &&
          website == other.website &&
          response == other.response;

  @override
  int get hashCode =>
      super.hashCode ^
      rated.hashCode ^
      releases.hashCode ^
      runtime.hashCode ^
      genre.hashCode ^
      director.hashCode ^
      writer.hashCode ^
      actors.hashCode ^
      plot.hashCode ^
      language.hashCode ^
      country.hashCode ^
      awards.hashCode ^
      ratings.hashCode ^
      metaScore.hashCode ^
      imdbRating.hashCode ^
      imdbVotes.hashCode ^
      dvd.hashCode ^
      boxOffice.hashCode ^
      production.hashCode ^
      website.hashCode ^
      response.hashCode;
}