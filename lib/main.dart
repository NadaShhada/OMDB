import 'package:flutter/material.dart';
import 'package:omdb/core/constantas/my_colors.dart';

import 'core/omdb_widgets/platform.dart';
import 'features/presentation/views/home.dart';
import 'features/presentation/views/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomeMaterial());
}

class HomeMaterial extends StatefulWidget {
  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  DarkMode darkMode = DarkMode();

  @override
  void initState() {
    darkMode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //dark mode or light mode
      themeMode: darkMode.dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(backgroundColor: MyColors.appColor),
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider<DarkMode>(
          create: (cx) => darkMode,
          child: Platform(
            desktop: const Home(),
            tablet: SplashView(),
            mobile: SplashView(),
          )),
    );
  }
}

class DarkMode extends ChangeNotifier {
  bool _dark = false;

  DarkMode();

  set dark(bool value) {
    _dark = value;
    notifyListeners();
  }

  bool get dark => _dark;
}
