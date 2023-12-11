import 'dart:math';

import 'package:characters/characters.dart';

/// This determines how precise the generated timestamps should be.
enum Precision {
  day(24),

  hour(32),

  second(40),

  millisecond(48);

  const Precision(this._bitLength);

  ///This is the length of the timestamp in bits.
  final int _bitLength;

  ///This generates the timestamp.
  int get _timestamp {
    final value = DateTime.now().millisecondsSinceEpoch;

    switch (this) {
      case Precision.day:
        return value ~/ 86400000;
      case Precision.hour:
        return value ~/ 3600000;
      case Precision.second:
        return value ~/ 1000;
      case Precision.millisecond:
        return value;
    }
  }

  List<int> timeStampBits(String characters) {
    final resultLength = timestampLength(characters.characters.length);
    final result = List<int>.empty(growable: true);
    int timeStamp = _timestamp;

    // print(characters);
    // print(characters.characters);

    while (timeStamp > 0) {
      result.add(timeStamp % characters.characters.length);
      timeStamp = timeStamp ~/ characters.characters.length;
    }

    while (result.length < resultLength) {
      result.add(0);
    }

    return result.reversed.toList();
  }

  int timestampLength(int numberOfAlphabets) {
    final maxValue = pow(2, _bitLength) - 1;
    return _logN(maxValue, numberOfAlphabets).ceil();
  }

  double _logN(num x, num baseN) => log(x) / log(baseN);
}
