class Either<Data,Error>{
  final Data? data;
  final Error? error;

  Either({this.data, this.error});
}