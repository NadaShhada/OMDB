

import '../../data/models/search_show_model.dart';
import '../../domain/entites/search_shows.dart';

class SearchShowsModel extends SearchShows{
  SearchShowsModel(List<SearchShowModel> shows):super(shows);

  factory SearchShowsModel.fromJson(List<dynamic> json){
    List<SearchShowModel> tempList=[];
    for(int i=0;i< json.length;i++){
      tempList.add(SearchShowModel.fromJson(json[i]));
    }
    return SearchShowsModel(tempList);
  }
  List<Map<String,String>> toJson(){
    List<Map<String,String>> tempList = [];
    for(int i=0;i< shows.length;i++){
      tempList.add((shows[i] as SearchShowModel).toJson());
    }
    return tempList;
  }
}
