import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/rating.dart';

class RatingTest extends Rating{
  RatingTest({
  required String source,
  required String value}): super(source: source,value: value);



}
void main() {
  test('Testing Rating_Test class en equality', () {
    RatingTest s1=RatingTest(source: 's',value: 'd');
    RatingTest s2=RatingTest(source: '8',value: 'd');

    expect(s1==s2, true);
  });
}