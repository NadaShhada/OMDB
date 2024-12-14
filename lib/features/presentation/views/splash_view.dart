import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../core/constantas/texts.dart';
import '../../../core/omdb_widgets/circular_image.dart';
import '../../../core/omdb_widgets/platform.dart';
import '../../../main.dart';
import '../blocks/splash_screen_bloc/splash_cubit.dart';
import '../blocks/splash_screen_bloc/splash_state.dart';
import 'home.dart';



class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin  {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final SplashCubit _cubit=SplashCubit();
  @override
  void initState() {
     _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
        _controller);
    _cubit.startTimer();
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    DarkMode dark = Provider.of<DarkMode>(context,listen: false);
    List<Widget> widgets = [
      CircularImage.network(
        url: Texts.logo,
        factor: Platform.isMobile(context) ? 2 : 3,
      ),
      Platform.isMobile(context)
          ? const SizedBox(
        height: 30,
      )
          : const SizedBox(
        width: 100,
      ),
      Text(
        Texts.appName,
        style: TextStyle(
            fontSize: Platform.isMobile(context) ? 20 : 32,
            fontWeight: FontWeight.bold),
      )
    ];
    return BlocListener<SplashCubit, SplashState>(
      bloc: _cubit,
        listener: (context, state) {


          if (state is SplashWaitingState) {
            _controller.repeat();

          } else
          if (state is SplashDoneState) {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext cx) => ChangeNotifierProvider<DarkMode>(
                    create: (cx) => dark,
                    child: const Home())));
          }
        },
        child: Scaffold(
          body:  Container(
            color: Colors.white,
            child: FadeTransition(
              opacity: _animation,
              child: Center(
                child: Platform.isMobile(context)
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgets,
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgets,
                ),
              )),
            ),
          ),
        );
  }
}
