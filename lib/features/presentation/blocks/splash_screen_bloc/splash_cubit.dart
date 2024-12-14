import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void startTimer() async{
    await Future.delayed( Duration.zero);

    emit(SplashWaitingState());
   await Future.delayed(const Duration(seconds: 3));
  emit(SplashDoneState());}
}
