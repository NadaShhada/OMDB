abstract class SplashState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplashState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class SplashInitialState extends SplashState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is SplashInitialState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class SplashWaitingState extends SplashState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is SplashWaitingState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class SplashDoneState extends SplashState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is SplashDoneState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
