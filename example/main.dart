import 'package:num_to_txt/num_to_txt.dart';

main() {
  print(numToTxt.numToOrdinal(10));
  print(numToTxt.numToString(100));

  print(numToTxt.changeLanguage("en_GB"));
  print(numToTxt.numToString(100));
}
