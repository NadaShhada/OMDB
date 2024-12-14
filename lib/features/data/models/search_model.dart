


import '../../domain/entites/search.dart';
import 'search_shows_model.dart';

class SearchModel extends Search{
  SearchModel({
    required SearchShowsModel shows,
    required String totalResult,
  }) : super(shows:shows,totalResult:totalResult);

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(shows: SearchShowsModel.fromJson(json["Search"]),totalResult:json["totalResults"]!
        );
  }

  Map<String, dynamic> toJson() {
    return {'Search':(shows as SearchShowsModel).toJson(),'totalResults':totalResult};
  }
}
