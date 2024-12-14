import 'search_show.dart';
import 'package:collection/equality.dart';

abstract class SearchShows {
  final List<SearchShow> shows;

  SearchShows(this.shows);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchShows &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(shows , other.shows);

  @override
  int get hashCode => shows.hashCode;
}
