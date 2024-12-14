
import '../../domain/entites/search_error.dart';

class SearchErrorModel extends SearchError{
  SearchErrorModel({required String response,
  required String error}):super(response: response,error: error);
  factory SearchErrorModel.fromJson(Map<String,dynamic> json){
    return SearchErrorModel(response:json['Response']!,error:json["Error"]!);
  }
  Map<String,dynamic> toJson(){
    return{'Response':response,'Error':error};
  }

}