import 'package:flutter/material.dart';
import 'package:omdb/core/constantas/texts.dart';
import 'package:omdb/features/presentation/widgets/my_switch.dart';
import 'package:provider/provider.dart';
import '../../../core/omdb_widgets/circular_image.dart';
import '../../../core/omdb_widgets/platform.dart';
import '../views/home.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var filter = Provider.of<RequestDataNotifier>(context, listen: false);
    return Container(
      color: Theme.of(context).backgroundColor,
      width: Platform.getWidth(context) *
          (Platform.isDesktop(context) ? 0.12 : 0.30),
      height: Platform.getHeight(context),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularImage.network(url: Texts.logo,),
          ),
          ListTile(
            title: const Text('Movie'),
            onTap: () {
              filter.type = 'Movie';
              filter.page = 1;
              filter.notify();
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Series'),
            onTap: () {
              filter.type = 'Series';
              filter.page = 1;
              filter.notify();
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Episodes'),
            onTap: () {
              filter.type = 'Episodes';
              filter.page = 1;
              filter.notify();
              //Navigator.pop(context);
            },
          ),
          MySwitch()
        ]),
      ),
    );
  }
}
