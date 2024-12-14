import 'package:flutter/material.dart';
import 'package:omdb/features/domain/usecases/searching_by_title.dart';
import 'package:omdb/features/presentation/views/home.dart';

import '../../../core/constantas/texts.dart';
import '../../../core/omdb_widgets/platform.dart';
import 'package:provider/provider.dart';

import '../blocks/home_bloc/home_cubit.dart';

class MyAppBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomeCubit>(context, listen: false);
    var filter = Provider.of<RequestDataNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: 0.4,
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              (!Platform.isDesktop(context))
                  ? IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu_rounded))
                  : Container(),
              (Platform.isTablet(context))
                  ? Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(Texts.appName),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: Texts.searchHint,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _yearController,
                      decoration: const InputDecoration(
                        hintText: Texts.yearHint,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    filter.title = _controller.text;
                    filter.year = _yearController.text;
                    bloc.getSearchModel(SearchingByTitleParams(
                        s: _controller.text,
                        y: _yearController.text,
                        page: filter.page.toString()));
                  },
                  icon: const Icon(Icons.search_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
