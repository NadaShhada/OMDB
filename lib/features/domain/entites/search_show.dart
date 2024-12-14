import 'show.dart';

abstract class SearchShow extends Show{
  SearchShow({ required String title,
    required String year,
    required String imdbId,
    required String type,
    required String poster,
  }):super(poster:poster ,type:type ,title: title,imdbId:imdbId ,year: year);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchShow && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}