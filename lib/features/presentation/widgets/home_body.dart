import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb/features/data/models/search_model.dart';
import 'package:omdb/features/presentation/blocks/home_bloc/home_cubit.dart';
import 'package:omdb/features/presentation/blocks/models_state.dart';
import 'package:omdb/features/presentation/blocks/show_bloc/show_cubit.dart';

import 'package:provider/provider.dart';
import '../../../core/omdb_widgets/platform.dart';
import '../../domain/entites/search_show.dart';
import '../../domain/usecases/searching_by_title.dart';
import '../views/home.dart';
import 'show_widget.dart';

class HomeBody extends StatelessWidget {
  final _controller = ScrollController();
  final ShowCubit _cubit = ShowCubit();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          Provider.of<RequestDataNotifier>(context, listen: false).page++;
          Provider.of<RequestDataNotifier>(context, listen: false).notify();
        }
      }
    });
    var bloc = Provider.of<HomeCubit>(context, listen: false);
    var notifier = Provider.of<RequestDataNotifier>(context, listen: false);
    notifier.addListener(() {
      bloc.getSearchModel(SearchingByTitleParams(
          s: notifier.title,
          y: notifier.year,
          type: notifier.type,
          page: '${notifier.page}'));
    });
    return BlocBuilder<HomeCubit, ModelsState>(
        bloc: bloc,
        builder: (cx, ModelsState state) {
          if (state is ModelInitialState) {
            return const Center(
              child: Text("List is not available yet"),
            );
          } else if (state is ModelsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ModelsErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          List<SearchShow> shows =
              ((state as ModelsDataState).data as SearchModel).shows.shows;
          List<Widget> widgets = [];
          for (int i = 0; i < shows.length; i++) {
            widgets.add(ShowWidget(
              data: shows[i],
              index: i,
            ));
          }
          return BlocProvider(
            create: (cx) => _cubit,
            child: Expanded(
              child: GridView.count(
                controller: _controller,
                crossAxisCount: (Platform.isDesktop(context))
                    ? 3
                    : Platform.getWidth(context) ~/ 200,
                children: widgets,
              ),
            ),
          );
        });
  }
}
