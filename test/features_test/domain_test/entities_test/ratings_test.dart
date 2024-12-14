import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/rating.dart';
import 'package:omdb/features/domain/entites/ratings.dart';

import 'rating_test.dart';

class RatingsTest extends Ratings{
  RatingsTest({ required List<Rating> ratings

}): super(ratings);
}
void main() {
  test('Testing Ratings class en equality', () {
    RatingTest d=RatingTest(source:"f",value:"fg");
    RatingsTest s1=RatingsTest(ratings:[d] );
    RatingsTest s2=RatingsTest(ratings:[d] );
    expect(s1==s2, true);
  });
}