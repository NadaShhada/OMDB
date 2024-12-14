abstract class ModelsState{

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelsState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
class ModelInitialState extends ModelsState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ModelInitialState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class ModelsLoadingState extends ModelsState {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ModelsLoadingState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}

class ModelsDataState<Data> extends ModelsState {

  final Data data;
  ModelsDataState(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ModelsDataState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => super.hashCode ^ data.hashCode;
}
class ModelsErrorState extends ModelsState {

  final String error;
  ModelsErrorState(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ModelsErrorState &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => super.hashCode ^ error.hashCode;
}

