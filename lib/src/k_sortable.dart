// ignore_for_file: do_not_use_environment, avoid_positional_boolean_parameters

import 'dart:math';

import 'errors.dart';

/// This determines how sortable the generated timestamps should be.
enum KSortable {
  ///No timestamps are used.
  none(0),

  /// This generates timestamps as years since epoch.
  years(4),

  /// This generates timestamps as months since epoch.
  months(5),

  /// This generates timestamps as weeks since epoch.
  weeks(6),

  /// This generates timestamps as days since epoch.
  days(7),

  /// This generates timestamps as hours since epoch.
  hours(8),

  /// This generates timestamps as minutes since epoch.
  minutes(10),

  /// This generates timestamps as seconds since epoch.
  seconds(11),

  /// This generates timestamps as milliseconds since epoch.
  milliseconds(14),

  /// This generates timestamps as microseconds since epoch. On web, it uses
  /// millisecondsSinceEpoch and adds randomly generated microsecond values.
  microseconds(17),

  /// This generates timestamps as nanoseconds since epoch. Since it is not
  /// natively supported, the nanosecond values are randomly generated and added
  /// to millisecondsSinceEpoch on Web or microsecondsSinceEpoch on the other
  /// platforms.
  nanoseconds(20),

  /// This generates timestamps as picoseconds since epoch. Since it is not
  /// natively supported, the picosecond values are randomly generated and added
  /// to millisecondsSinceEpoch on Web or microsecondsSinceEpoch on the other
  /// platforms.
  picosecond(23);

  const KSortable(this.timestampLength);

  ///This is the length of the timestamp as an integer in base 10.
  final int timestampLength;

  ///This generates the timestamp based on the kSortable. The optional [isWeb]
  ///is not necessary except in testing as the package can detect if it is
  ///running on the web.
  BigInt generateTimestamp([bool? isWeb]) {
    isWeb ??= const bool.fromEnvironment('dart.library.js_util');

    if (isWeb) {
      return _timestampForWeb;
    }

    return _timestampForNative;
  }

  BigInt get _timestampForNative {
    //Used to randomize values that a dart platform does not natively generate
    final random = Random.secure();
    final randomNanoseconds = BigInt.from(random.nextInt(1000));
    final randomPicoseconds = BigInt.from(random.nextInt(1000000));

    final value = BigInt.from(DateTime.now().microsecondsSinceEpoch);

    switch (this) {
      case KSortable.none:
        throw unsupportedSortableCase;
      case KSortable.years:
        return value ~/ BigInt.from(31556952000000);
      case KSortable.months:
        return value ~/ BigInt.from(2629746000000);
      case KSortable.weeks:
        return value ~/ BigInt.from(604800000000);
      case KSortable.days:
        return value ~/ BigInt.from(86400000000);
      case KSortable.hours:
        return value ~/ BigInt.from(3600000000);
      case KSortable.minutes:
        return value ~/ BigInt.from(60000000);
      case KSortable.seconds:
        return value ~/ BigInt.from(1000000);
      case KSortable.milliseconds:
        return value ~/ BigInt.from(1000);
      case KSortable.microseconds:
        return value;
      case KSortable.nanoseconds:
        return (value * BigInt.from(1000)) + randomNanoseconds;
      case KSortable.picosecond:
        return (value * BigInt.from(1000000)) + randomPicoseconds;
    }
  }

  BigInt get _timestampForWeb {
    //Used to randomize values that a dart platform does not natively generate
    final random = Random.secure();
    final randomMicroseconds = BigInt.from(random.nextInt(1000));
    final randomNanoseconds = BigInt.from(random.nextInt(1000000));
    final randomPicoseconds = BigInt.from(random.nextInt(1000000000));

    final value = BigInt.from(DateTime.now().millisecondsSinceEpoch);

    switch (this) {
      case KSortable.none:
        throw UnsupportedError('This case should never be called');
      case KSortable.years:
        return value ~/ BigInt.from(31556952000);
      case KSortable.months:
        return value ~/ BigInt.from(2629746000);
      case KSortable.weeks:
        return value ~/ BigInt.from(604800000);
      case KSortable.days:
        return value ~/ BigInt.from(86400000);
      case KSortable.hours:
        return value ~/ BigInt.from(3600000);
      case KSortable.minutes:
        return value ~/ BigInt.from(60000);
      case KSortable.seconds:
        return value ~/ BigInt.from(1000);
      case KSortable.milliseconds:
        return value;
      case KSortable.microseconds:
        return (value * BigInt.from(1000)) + randomMicroseconds;
      case KSortable.nanoseconds:
        return (value * BigInt.from(1000000)) + randomNanoseconds;
      case KSortable.picosecond:
        return (value * BigInt.from(1000000000)) + randomPicoseconds;
    }
  }
}
