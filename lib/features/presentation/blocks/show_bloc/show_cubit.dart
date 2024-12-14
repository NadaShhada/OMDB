import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/either.dart';
import '../../../data/reposiories/search_repository_imp.dart';
import '../../../domain/entites/details_show.dart';
import '../../../domain/repositories/search_repository.dart';
import '../../../domain/usecases/searching_by_id_or_title.dart';
import '../models_state.dart';

class ShowCubit extends Cubit<ModelsState> {
  ShowCubit() : super(ModelInitialState());

  void getDetailsShowModel(SearchingByIdOrTitleParams params) async {
    emit(ModelsLoadingState());
    SearchRepository repo = SearchRepositoryImp();
    SearchingByIdOrTitle searchingByIdOrTitle = SearchingByIdOrTitle(repo);
    Either<DetailsShow, String> result = await searchingByIdOrTitle.call(params);
    if (result.data != null) {
      emit(ModelsDataState<DetailsShow>(result.data!));
    } else {
      emit(ModelsErrorState(result.error!));
    }
  }
}
