import 'package:test/test.dart';

import 'package:num_to_txt/num_to_txt.dart';

void main() {
  test('Convert to classic', () {
    expect(numToTxt.numToString(2), "two");
  });

  test('Convert to ordinal', () {
    expect(numToTxt.numToOrdinal(2), "second");
  });
}
