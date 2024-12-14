import '../../domain/entites/search_show.dart';

class SearchShowModel extends SearchShow {
  SearchShowModel({
    required String title,
    required String year,
    required String imdbId,
    required String type,
    required String poster,
  }) : super(
            poster: poster,
            type: type,
            title: title,
            imdbId: imdbId,
            year: year);

  factory SearchShowModel.fromJson(Map<String, dynamic> json) {
    return SearchShowModel(
        poster: json["Poster"]!,
        type: json["Type"]!,
        title: json["Title"]!,
        imdbId: json["imdbID"]!,
        year: json["Year"]!);
  }

  Map<String, String> toJson() {
    return {"Poster":poster,
  "Type":type,
    "Title":title,
   "imdbID":imdbId,
   "Year":year};
  }
}
