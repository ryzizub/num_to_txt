# num_to_txt

A package for parsing numbers into real english words

![Pub Version](https://img.shields.io/pub/v/num_to_txt)

## Usage

```dart
import 'package:num_to_txt/num_to_txt.dart';

main() {
  print(numToTxt.numToOrdinal(10));
  print(numToTxt.numToString(100));

  print(numToTxt.changeLanguage("en_GB"));
  print(numToTxt.numToString(100));
}

```

### numToString

Number becomes word like one, two, three, ten thousand etc.

### numToOrdinal

Number becomes word like first, second, one hundredth etc.
