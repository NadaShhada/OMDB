import 'dart:convert';



import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entites/details_show.dart';
import '../../../domain/entites/search.dart';
import '../../../domain/usecases/searching_by_id_or_title.dart';
import '../../../domain/usecases/searching_by_title.dart';
import '../../models/details_show_model.dart';
import '../../models/search_model.dart';
import 'local_operations.dart';

class LocalOperationsImp implements LocalOperations {
  @override
  Future<DetailsShow?> restoreDetailsShowModel(
      SearchingByIdOrTitleParams params) async {
    final prefs = await SharedPreferences.getInstance();
    String? results = prefs.getString(params.toString());
    if (results != null) {
      var json = jsonDecode(results);
      return DetailsShowModel.fromJson(json);
    }
    return Future.value(null);
  }

  @override
  Future<Search?>  restoreSearchModel(SearchingByTitleParams params)async {
    final prefs = await SharedPreferences.getInstance();
    String? results = prefs.getString(params.toString());
    if (results != null) {
      var json = jsonDecode(results);
      return SearchModel.fromJson(json);
    }
    return Future.value(null);
  }

  @override
  Future<void> storeDetailsShowModel(
      SearchingByIdOrTitleParams params, DetailsShow model) async {
    var json = (model as DetailsShowModel).toJson();
    String result = jsonEncode(json);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(params.toString(), result);
  }

  @override
  Future<void> storeSearchModel(SearchingByTitleParams params, Search model)async {
    var json = (model as SearchModel).toJson();
    String result = jsonEncode(json);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(params.toString(), result);
  }
}

