// ignore_for_file: use_string_buffers

import 'dart:math';

import 'package:b/b.dart';
import 'package:characters/characters.dart';

import 'errors.dart';
import 'k_sortable.dart';

/// Like nanoid but k-sortable
class TinyID {
  TinyID({
    /// These are the alphabets the ids would be generated from.
    String customAlphabets = base64url,
    this.kSortable = KSortable.millisecond,
    this.minNumberOfRandomCharacters = 3,
    this.receiveCollisionWarnings = true,
    this.bodyLength = 21,
    this.suffix = '',
    this.prefix = '',
  }) : customAlphabets = customAlphabets.characters.toSet().toList().join() {
    _validateAlphabets();
    _validateLength();
  }

  /// This string will appear at the beginning of every id that is generated.
  final String prefix;

  /// These are the alphabets the ids would be generated from.
  final String customAlphabets;

  /// This determines how sortable the generated ids should be.
  final KSortable kSortable;

  /// The length of the body of the generated id. It does not include the length
  /// of the [prefix] or [suffix].
  final int bodyLength;

  /// This is the minimum number of random characters the id should have to
  /// prevent collisions.
  final int minNumberOfRandomCharacters;

  /// When this is true, generating an id that its body is not long enough to
  /// hold the number of random characters in [minNumberOfRandomCharacters]
  /// would throw an error. When it is false, the body of the id would be
  /// trimmed so that it would always have the [bodyLength] specified.
  final bool receiveCollisionWarnings;

  /// This string will appear at the end of every id that is generated.
  final String suffix;

  /// The number of random letters added to improve collision resistance. When
  /// this value is positive, random characters were added to the ids body. When
  /// it is negative, some characters were trimmed out of the ids body.
  int get numberOfRandomCharacters => bodyLength - numberOfSortableCharacters;

  /// This is the number of lexicographically sortable characters.
  int get numberOfSortableCharacters =>
      kSortable.calculateTimestampLength(customAlphabets.length);

  /// This generates the nextId according to the saved parameters
  String get nextId {
    if (kSortable == KSortable.none) {
      return prefix + _sortableString + _randomString + suffix;
    }
    return prefix + _sortableString + _randomString + suffix;
  }

  /// This gives information about the likelihood of a collision based on the
  /// instance parameters.
  String get collisionInfo {
    //FIX: Does not work as intended
    final numOfIds =
        sqrt(numberOfRandomCharacters * customAlphabets.length / 50).round();
    final noSortableMessage =
        'You need to generate $numOfIds ids to have a 1% chance of id collision';
    final sortableMessage =
        'You need to generate $numOfIds ids every ${kSortable.name} to have a 1% chance of id collision';

    if (kSortable == KSortable.none) {
      return noSortableMessage;
    }

    return sortableMessage;
  }

  void _validateLength() {
    if (!receiveCollisionWarnings) return;

    final highChanceOfCollision =
        numberOfRandomCharacters < minNumberOfRandomCharacters;

    if (highChanceOfCollision) {
      throw collisionError;
    }
  }

  void _validateAlphabets() {
    if (customAlphabets.length < 2) {
      throw insufficientAlphabetError;
    }
  }

  String get _sortableString {
    final converter = BaseConversion(from: decimal, to: customAlphabets);
    String baseString = converter(kSortable.generateTimestamp());

    while (baseString.length < numberOfSortableCharacters) {
      baseString = customAlphabets.characters.first + baseString;
    }

    return baseString;
  }

  String get _randomString {
    final random = Random.secure();
    final lengthOfStringToGenerate = bodyLength - numberOfSortableCharacters;
    final alphabets = customAlphabets.characters.toList();

    String randomString = '';

    while (randomString.length < lengthOfStringToGenerate) {
      final nextIndex = random.nextInt(alphabets.length);
      randomString = randomString + alphabets[nextIndex];
    }

    return randomString;
  }
}
