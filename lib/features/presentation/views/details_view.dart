import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:omdb/features/domain/usecases/searching_by_id_or_title.dart';
import 'package:omdb/features/presentation/blocks/home_bloc/home_cubit.dart';
import 'package:omdb/features/presentation/blocks/models_state.dart';
import 'package:omdb/features/presentation/blocks/show_bloc/show_cubit.dart';
import 'package:omdb/features/presentation/views/home.dart';

import '../../../core/constantas/texts.dart';
import '../../../core/omdb_widgets/platform.dart';
import '../../domain/entites/details_show.dart';
import '../widgets/show_more_button.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  final int index;

  const DetailsView(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = Provider.of<ShowCubit>(context, listen: false);
    final filter = Provider.of<RequestDataNotifier>(context, listen: false);
    final homeCubit = Provider.of<HomeCubit>(context, listen: false);
    cubit.getDetailsShowModel(SearchingByIdOrTitleParams(
        y: filter.year,
        type: filter.type,
        plot: 'short',
        i: (homeCubit.state as ModelsDataState)
            .data
            .shows
            .shows[index]
            .imdbId));
    return Scaffold(
      body:
          BlocBuilder<ShowCubit, ModelsState>(builder: (cx, ModelsState state) {
        if (state is ModelsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ModelsErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is ModelsDataState) {
          DetailsShow model = state.data;
          List<Widget> widgets = [
            Stack(children: [
              Image.network(
                model.poster == 'N/A' ? Texts.logo : model.poster,
                height: !Platform.isMobile(context)
                    ? Platform.getHeight(context)
                    : null,
                width: Platform.isMobile(context)
                    ? Platform.getWidth(context)
                    : null,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(color: Colors.orange),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RatingBar.builder(
                        initialRating: double.parse(model.imdbRating),
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(
              width: !Platform.isMobile(context) ? 20 : null,
              height: Platform.isMobile(context) ? 20 : null,
            ),
            Column(
              children: [
                Text(model.actors),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(model.plot),
                    ShowMoreButton((bool isMore) {
                      cubit.getDetailsShowModel(SearchingByIdOrTitleParams(
                          y: filter.year,
                          type: filter.type,
                          plot: isMore ? 'short' : 'full',
                          i: (homeCubit.state as ModelsDataState)
                              .data
                              .shows
                              .shows[index]
                              .imdbId));
                    })
                  ],
                )
              ],
            )
          ];
          return !Platform.isMobile(context)
              ? Row(
                  children: widgets,
                )
              : Column(
                  children: widgets,
                );
        } else {
          return Container();
        }
      }),
    );
  }
}
