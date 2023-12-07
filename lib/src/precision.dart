/// This determines how precise the generated timestamps should be.
enum Precision {
  day(24),

  hour(32),

  second(40),

  millisecond(48);

  const Precision(this.timestampBitLength);

  ///This is the length of the timestamp in bits.
  final int timestampBitLength;

  ///This generates the timestamp.
  int get timestamp {
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
}
