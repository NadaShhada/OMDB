import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb/features/presentation/blocks/home_bloc/home_cubit.dart';
import 'package:omdb/features/presentation/widgets/home_body.dart';
import 'package:omdb/features/presentation/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import '../../../core/omdb_widgets/platform.dart';
import '../widgets/app_bar.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RequestDataNotifier>(
      create: (cx) => RequestDataNotifier(),
      child: Scaffold(
          drawer: (!Platform.isDesktop(context)) ? MyDrawer() : null,
          body: BlocProvider(
            lazy: false,
            create: (cx) {
              //return the block of this widget
              return HomeCubit();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Platform.isDesktop(context) ? MyDrawer() : Container(),
                Expanded(
                    child: Column(
                  children: [MyAppBar(), Expanded(child: HomeBody())],
                ))
              ],
            ),
          )),
    );
  }
}

class RequestDataNotifier extends ChangeNotifier {
  String _year = "";
  String _type = 'Movie';
  String _title = "";
  int _page = 1;

  int get page => _page;

  set page(int value) {
    _page = value;
  }

  set title(String value) {
    _title = value;
  }

  String get title => _title;

  set year(String value) {
    _year = value;
  }

  set type(String value) {
    _type = value;
  }

  void notify() {
    notifyListeners();
  }

  String get type => _type;

  String get year => _year;
}
