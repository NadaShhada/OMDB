import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omdb/core/constantas/styles.dart';
import 'package:omdb/features/domain/entites/search_show.dart';
import 'package:omdb/features/presentation/blocks/home_bloc/home_cubit.dart';
import 'package:omdb/features/presentation/blocks/show_bloc/show_cubit.dart';
import 'package:omdb/features/presentation/views/details_view.dart';
import 'package:omdb/features/presentation/views/home.dart';
import 'package:provider/provider.dart';
import '../../../core/constantas/texts.dart';

class ShowWidget extends StatefulWidget {
  final int index;
  final SearchShow data;

  const ShowWidget({required this.index, required this.data, Key? key})
      : super(key: key);

  @override
  State<ShowWidget> createState() => _ShowWidgetState();
}

class _ShowWidgetState extends State<ShowWidget> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (cx) {
          return MultiBlocProvider(providers: [
            //BlocProvider(
              //  create: (cx) => Provider.of<ShowCubit>(context, listen: false)),
            BlocProvider<ShowCubit>.value(
              value: ShowCubit(),
            ),
            BlocProvider(
                create: (cx) => Provider.of<HomeCubit>(context, listen: false)),
            ChangeNotifierProvider(
                create: (cx) =>
                    Provider.of<RequestDataNotifier>(context, listen: false))
          ], child: DetailsView(widget.index));
        }));
      },
      onTapDown: (TapDownDetails det) {
        _opacity = 0.4;
        setState(() {});
      },
      onTapUp: (TapUpDetails det) {
        _opacity = 0.0;
        setState(() {});
      },
      child: SizedBox(
        height: 300,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(widget.data.poster == 'N/A'
                              ? Texts.logo
                              : widget.data.poster),
                          fit: BoxFit.fill)),
                ),
                SizedBox.expand(
                  child: Opacity(
                      opacity: _opacity,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0)),
                      )),
                ),
                (_opacity == 0.4)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.data.title,
                              style: Styles.showStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.data.year,
                              style: Styles.showStyle,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.data.type,
                              style: Styles.showStyle,
                            )
                          ],
                        ),
                      )
                    : const SizedBox()
              ])),
        ),
      ),
    );
  }
}
