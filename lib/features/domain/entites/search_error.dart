abstract class SearchError {
  final String response;
  final String error;

  SearchError({required this.response, required this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchError &&
          runtimeType == other.runtimeType &&
          response == other.response &&
          error == other.error;

  @override
  int get hashCode => response.hashCode ^ error.hashCode;
}
