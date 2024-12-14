abstract class Show {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;

  Show(
      {required this.title,
      required this.year,
      required this.imdbId,
      required this.type,
      required this.poster});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Show &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          year == other.year &&
          imdbId == other.imdbId &&
          type == other.type &&
          poster == other.poster;

  @override
  int get hashCode =>
      title.hashCode ^
      year.hashCode ^
      imdbId.hashCode ^
      type.hashCode ^
      poster.hashCode;
}
