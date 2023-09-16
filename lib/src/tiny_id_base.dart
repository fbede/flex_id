import 'package:b/b.dart';
import 'package:characters/characters.dart';

import 'errors.dart';
import 'k_sortable.dart';

/// Like nanoid but k-sortable
class TinyID {
  /// This string will appear at the beginning of every id that is generated.
  final String prefix;

  /// These are the alphabets the ids would be generated from.
  final String customAlphabets;

  /// This determines how sortable the generated ids should be.
  final KSortable kSortable;

 

  /// The maximum length of the generated id. It would throw an error if it is
  /// less than the length of [prefix] + the length of [suffix] +
  /// [numberOfRandomCharacters]. It will also throw an error if it is
  /// smaller than the result of [_test].
  final int? maxLength;

  /// This string will appear at the end of every id that is generated.
  final String suffix;

  TinyID({
    this.numberOfRandomCharacters = 13,
    this.maxLength,
    this.suffix = '',
    this.prefix = '',

    /// These are the alphabets the ids would be generated from.
    String customAlphabets = base64url,
    this.kSortable = KSortable.milliseconds,
  }) : customAlphabets = customAlphabets.characters.toSet().toList().join() {
    _validateMaxLength();
  }

   /// The number of random letters to be added to improve collision resistance.
   int get numberOfRandomCharacters = KSortable.;

  void _validateMaxLength() {
    final maxLengthIsNotNull = maxLength != null;
    final maxLengthTooSmall =
        maxLength! > prefix.length + suffix.length + numberOfRandomCharacters;
    if (maxLengthIsNotNull && maxLengthTooSmall) {
      throw maxLengthTooSmallError;
    }
  }

  String _test() => '';

String generateWithCustomTimeStamp(Int)
}
