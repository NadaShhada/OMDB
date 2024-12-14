import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/helper/either.dart';
import '../../domain/entites/details_show.dart';
import '../../domain/entites/search.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/usecases/searching_by_id_or_title.dart';
import '../../domain/usecases/searching_by_title.dart';
import '../data-sourses/global_data_sources/global_operations_imp.dart';
import '../data-sourses/local_data_sources/local_operations_imp.dart';
import '../models/details_show_model.dart';
import '../models/search_error_model.dart';
import '../models/search_model.dart';

class SearchRepositoryImp implements SearchRepository {
  @override
  Future<Either<DetailsShow, String>> searchByIdOrTitle(
      SearchingByIdOrTitleParams params) async {
    var data;
    LocalOperationsImp local = LocalOperationsImp();

    try {
      //connection to api
      GlobalOperationsImp global = GlobalOperationsImp();
      data = await global.getDetailsShow(params);
      // processing data
      DetailsShowModel model = DetailsShowModel.fromJson(data);
      //store data
      local.storeDetailsShowModel(params, model);
      return Either(data: model);
    } catch (e) {
      if (e is DioError) {
        //no internet connection error
        if (e.error is SocketException) {
          DetailsShowModel? model =
              await local.restoreDetailsShowModel(params) as DetailsShowModel?;
          if (model != null) {
            return Either(data: model);
          }
          return Either(error: "no internet connection!");
        } //no api key
        else if (e.type == DioErrorType.badResponse &&
            e.response != null &&
            e.response!.statusCode == 401) {
          return Either(error: "Unauthorized access");
        } else {
          return Either(error: "Failed connection to the server");
        }
      } //error for processing data
      else {
        try {
          print("processing");
          SearchErrorModel error = SearchErrorModel.fromJson(data);
          return Either(error: error.error);
        } catch (e) {
          return Either(error: "Failed processing data");
        }
      }
      return Either(error: e.toString());
    }
  }

  @override
  Future<Either<Search, String>> searchByTitle(
      SearchingByTitleParams params) async {
    var data;
    LocalOperationsImp local = LocalOperationsImp();

    try {
      //connection to api
      GlobalOperationsImp global = GlobalOperationsImp();
      data = await global.getSearch(params);
      // processing data
      SearchModel model = SearchModel.fromJson(data);
      //store data
      local.storeSearchModel(params, model);
      return Either(data: model);
    } catch (e) {
      print(e.runtimeType);
      if (e is DioError) {
        print(e.error.runtimeType);
        //no internet connection error
        if (e.error is SocketException) {
          SearchModel? model =
              await local.restoreSearchModel(params) as SearchModel?;
          if (model != null) {
            return Either(data: model);
          }
          return Either(error: "no internet connection");
        } //no api key
        else if (e.type == DioErrorType.badResponse &&
            e.response != null &&
            e.response!.statusCode == 401) {
          return Either(error: "Unauthorized access");
        } else {
          return Either(error: "Failed connection to the server");
        }
      } //error for processing data
      else {
        try {
          print("processing");
          SearchErrorModel error = SearchErrorModel.fromJson(data);
          return Either(error: error.error);
        } catch (e) {
          return Either(error: "Failed processing data");
        }
      }
      return Either(error: e.toString());
    }
  }
}
