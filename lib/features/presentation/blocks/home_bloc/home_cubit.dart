import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb/features/data/models/search_model.dart';

import '../../../../core/helper/either.dart';
import '../../../data/models/search_shows_model.dart';
import '../../../data/reposiories/search_repository_imp.dart';
import '../../../domain/entites/search.dart';
import '../../../domain/repositories/search_repository.dart';
import '../../../domain/usecases/searching_by_title.dart';
import '../models_state.dart';

class HomeCubit extends Cubit<ModelsState> {
  HomeCubit() : super(ModelInitialState());

  void getSearchModel(SearchingByTitleParams params) async {
    if (int.parse(params.page) == 1) {
      emit(ModelsLoadingState());
    }
    ModelsDataState? dataState;
    if (state is ModelsDataState) {
      dataState = state as ModelsDataState;
    }
    if (dataState != null &&
        int.parse(dataState.data!.totalResult).ceil() <
            int.parse(params.page)) {
      emit(ModelsDataState(SearchModel(
          shows: SearchShowsModel([]),
          totalResult: dataState.data!.totalResult)));
      return;
    }


    SearchRepository repo = SearchRepositoryImp();
    SearchingByTitle searchingByTitle = SearchingByTitle(repo);
    Either<Search, String> result = await searchingByTitle.call(params);
    if (result.data != null) {
      if (dataState != null) {
        ModelsDataState newState = ModelsDataState(result.data!);
        newState.data.shows.shows.insertAll(0,dataState.data.shows.shows);
        emit(newState);
      } else {
        emit(ModelsDataState<Search>(result.data!));
      }
    } else {
      emit(ModelsErrorState(result.error!));
    }
  }
}
