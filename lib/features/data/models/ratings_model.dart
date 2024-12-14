
import '../../data/models/rating_model.dart';
import '../../domain/entites/ratings.dart';

class RatingsModel extends Ratings{
  RatingsModel(List<RatingModel> ratings):super(ratings);
  factory RatingsModel.fromJson(List<dynamic> json){
    List<RatingModel> tempList=[];
    for(int i=0;i< json.length;i++){
      tempList.add(RatingModel.fromJson(json[i]));
  }
    return RatingsModel(tempList);
  }
  List<Map<String,String>> toJson(){
    List<Map<String,String>> tempList = [];
    for(int i=0;i< ratings.length;i++){
      tempList.add((ratings[i] as RatingModel).toJson());
    }
    return tempList;
  }
}
