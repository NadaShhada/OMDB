abstract class Rating {
  final String source;
  final String value;

  Rating({required this.source, required this.value});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rating &&
          runtimeType == other.runtimeType &&
          source == other.source &&
          value == other.value;

  @override
  int get hashCode => source.hashCode ^ value.hashCode;
}
