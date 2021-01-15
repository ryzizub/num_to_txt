import 'package:num_to_txt/src/constants.dart';

class NumToTxt {
  /**
   * Convert number to traditional String like one, two, threen, thousand etc.
   *
   *     'Dart'NumToTxt.numToString(2); // two
   */
  static String numToString(int n) {
    if (n < 0) {
      n = -n;
    }
    if (n <= 19) {
      return names[n];
    }
    if (n <= 99) {
      return names[n / 10] + (n % 10 > 0 ? "-" + numToString(n % 10) : "");
    }
    String label;
    int factor = 0;
    if (n <= 999) {
      label = "hundred";
      factor = 100;
    } else if (n <= 999999) {
      label = "thousand";
      factor = 1000;
    } else if (n <= 999999999) {
      label = "million";
      factor = 1000000;
    } else if (n <= 999999999999) {
      label = "billion";
      factor = 1000000000;
    } else if (n <= 999999999999999) {
      label = "trillion";
      factor = 1000000000000;
    } else if (n <= 999999999999999999) {
      label = "quadrillion";
      factor = 1000000000000000;
    } else {
      label = "quintillion";
      factor = 1000000000000000000;
    }

    return numToString(n ~/ factor) +
        " " +
        label +
        (n % factor > 0 ? " " + numToString(n % factor) : "");
  }

  /**
   * Convert number to ordinal String like first, second, one hundredth etc.
   *
   *     'Dart'NumToTxt.numToOrdinal(2); // second
   */
  static String numToOrdinal(int n) {
    String spelling = numToString(n);
    List<String> split = spelling.split(" ");
    String last = split[split.length - 1];
    String replace = "";
    if (last.contains("-")) {
      List<String> lastSplit = last.split("-");
      String lastWithDash = lastSplit[1];
      String lastReplace = "";
      if (irregularOrdinals.containsKey(lastWithDash)) {
        lastReplace = irregularOrdinals[lastWithDash];
      } else if (lastWithDash.endsWith("y")) {
        lastReplace =
            lastWithDash.substring(0, lastWithDash.length - 1) + "ieth";
      } else {
        lastReplace = lastWithDash + "th";
      }
      replace = lastSplit[0] + "-" + lastReplace;
    } else {
      if (irregularOrdinals.containsKey(last)) {
        replace = irregularOrdinals[last];
      } else if (last.endsWith("y")) {
        replace = last.substring(0, last.length - 1) + "ieth";
      } else {
        replace = last + "th";
      }
    }
    split[split.length - 1] = replace;

    return split.join(' ');
  }
}
