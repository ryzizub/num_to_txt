// English words for the numbers
final Map<int, String> _names = {
  0: 'zero',
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
  20: 'twenty',
  30: 'thirty',
  40: 'forty',
  50: 'fifty',
  60: 'sixty',
  70: 'seventy',
  80: 'eighty',
  90: 'ninety',
};

// Irregular english words for the ordinal numbers
final Map<String, String> _irregularOrdinals = {
  'one': 'first',
  'two': 'second',
  'three': 'third',
  'five': 'fifth',
  'eight': 'eighth',
  'nine': 'ninth',
  'twelve': 'twelfth',
};

/**
 * English convertor
 */
class EngConvertor {
  /**
   * Convert number to traditional String like one, two, threen, thousand etc.
   *
   *     'Dart'numToTxt.numToString(2); // two
   */
  static String? numToString(int n) {
    if (n < 0) {
      n = -n;
    }
    if (n <= 19) {
      return _names[n];
    }
    if (n <= 99) {
      return _names[n / 10 as int]! +
          (n % 10 > 0 ? "-" + numToString(n % 10)! : "");
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

    return numToString(n ~/ factor)! +
        " " +
        label +
        (n % factor > 0 ? " " + numToString(n % factor)! : "");
  }

  /**
   * Convert number to ordinal String like first, second, one hundredth etc.
   *
   *     'Dart'numToTxt.numToOrdinal(2); // second
   */
  static String numToOrdinal(int n) {
    String spelling = numToString(n)!;
    List<String> split = spelling.split(" ");
    String last = split[split.length - 1];
    String? replace = "";
    if (last.contains("-")) {
      List<String> lastSplit = last.split("-");
      String lastWithDash = lastSplit[1];
      String? lastReplace = "";
      if (_irregularOrdinals.containsKey(lastWithDash)) {
        lastReplace = _irregularOrdinals[lastWithDash];
      } else if (lastWithDash.endsWith("y")) {
        lastReplace =
            lastWithDash.substring(0, lastWithDash.length - 1) + "ieth";
      } else {
        lastReplace = lastWithDash + "th";
      }
      replace = lastSplit[0] + "-" + lastReplace!;
    } else {
      if (_irregularOrdinals.containsKey(last)) {
        replace = _irregularOrdinals[last];
      } else if (last.endsWith("y")) {
        replace = last.substring(0, last.length - 1) + "ieth";
      } else {
        replace = last + "th";
      }
    }
    split[split.length - 1] = replace!;

    return split.join(' ');
  }
}
