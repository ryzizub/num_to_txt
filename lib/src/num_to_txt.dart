import 'package:num_to_txt/src/eng/convertor.dart';

const _supportedLanguages = [
  "en_US",
  "en_AU",
  "en_CA",
  "en_GB",
];

NumToTxt numToTxt = NumToTxt();

class NumToTxt {
  String language = "en_US";

  /**
   * Change your language, changes are applied everywhere
   */
  changeLanguage(String newLang) {
    if (_supportedLanguages.contains(newLang)) {
      language = newLang;
    } else {
      throw Exception("This language is not supported");
    }
  }

  /**
   * Convert number to traditional String like one, two, threen, thousand etc.
   *
   *     'Dart'numToTxt.numToString(2); // two
   */
  String? numToString(int n) {
    switch (language) {
      case "en_US":
        return EngConvertor.numToString(n);
      case "en_AU":
        return EngConvertor.numToString(n);
      case "en_CA":
        return EngConvertor.numToString(n);
      case "en_GB":
        return EngConvertor.numToString(n);
      default:
        return EngConvertor.numToString(n);
    }
  }

  /**
   * Convert number to ordinal String like first, second, one hundredth etc.
   *
   *     'Dart'numToTxt.numToOrdinal(2); // second
   */
  String numToOrdinal(int n) {
    switch (language) {
      case "en_US":
        return EngConvertor.numToOrdinal(n);
      case "en_AU":
        return EngConvertor.numToOrdinal(n);
      case "en_CA":
        return EngConvertor.numToOrdinal(n);
      case "en_GB":
        return EngConvertor.numToOrdinal(n);
      default:
        return EngConvertor.numToOrdinal(n);
    }
  }
}
