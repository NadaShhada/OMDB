import 'package:collection/equality.dart';

import 'rating.dart';

abstract class Ratings{
  final List<Rating> ratings;

  Ratings(  this.ratings);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ratings &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(ratings , other.ratings);

  @override
  int get hashCode => ratings.hashCode;
}