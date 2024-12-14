
import '../../domain/entites/rating.dart';

class RatingModel extends Rating{
  RatingModel({ required String source,
  required String value}):super(source: source,value: value);
  factory RatingModel.fromJson(Map<String,dynamic> json){
    return RatingModel(source:json["Source"]!,value:json["Value"]!);
  }
  Map<String,String> toJson(){
    return{"Source":source,"Value":value};
  }

}