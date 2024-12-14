import 'package:flutter_test/flutter_test.dart';
import 'package:omdb/features/domain/entites/search_error.dart';

class SearchErrorTest extends SearchError{
  SearchErrorTest( { required String response,
  required String error}):super(response:response,error:error);

}
void main() {
  test('Testing Show class en equality', () {
    SearchErrorTest s1=SearchErrorTest(response: '5',error: 'f');
    SearchErrorTest s2=SearchErrorTest(response: '5',error: 'f');

    expect(s1==s2, true);
  });
}
