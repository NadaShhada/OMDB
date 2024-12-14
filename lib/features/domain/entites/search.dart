import 'search_shows.dart';

abstract class Search{
  final SearchShows shows;
  final String totalResult;

  Search({ required this.shows,required this.totalResult});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Search &&
          runtimeType == other.runtimeType &&
          shows == other.shows &&
          totalResult == other.totalResult;

  @override
  int get hashCode => shows.hashCode ^ totalResult.hashCode;
}

