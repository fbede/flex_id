import 'package:characters/characters.dart';

import 'alphabets.dart';
import 'errors.dart';
import 'flex_encoder.dart';
import 'precision.dart';

/// Like nanoid but k-sortable
class FlexID {
  factory FlexID() => FlexID.custom(symbols: Alphabets.base64url.characters);

  FlexID.custom({
    required String symbols,
    this.precision = Precision.millisecond,
    this.length = 15,
    int minRandomCharacters = 3,
  }) {
    if (symbols.characters.toSet().length < 2) {
      throw insufficientAlphabetError;
    }
    final Set<String> symbolsSet = <String>{};

    this.symbols = symbols.characters.where(symbolsSet.add).toList().join();

    print(this.symbols);

    _timeStampEncoder = FlexTimeEncoder(this.symbols);

    if (numberOfRandomCharacters < minRandomCharacters) {
      throw lengthTooSmallError;
    }
  }

  /// This string will appear at the beginning of every id that is generated.
  final Precision precision;

  /// The length of the generated id.
  final int length;

  /// These are the symbols the ids would be generated from. The first one is
  /// the lowest value while the last one is the highest value.
  late final String symbols;

  late final FlexTimeEncoder _timeStampEncoder;

  int get numberOfRandomCharacters => length - numberOfSortableCharacters;

  int get numberOfSortableCharacters =>
      precision.timestampLength(symbols.length);

  String get nextId =>
      _timeStampEncoder.convert(precision.timeStampBits(symbols));
}
