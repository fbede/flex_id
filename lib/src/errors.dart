final maxLengthTooSmallError = ArgumentError('''
tiny_id cannot generate ids with the given parameters. Parameter "max length" seems to be too small.
Try adjusting other parameters to generate ids with the given length.''');

final unsupportedSortableCase = UnsupportedError(
  '''tiny_id unsupported case!!! This case should never be called for this kSortable type''',
);

final collisionError = ArgumentError('''
tiny_id collision warning!!! Sufficient number of random characters cannot be generated. Please 
adjust the parameters like bodyLength, kSortable, minNumberOfRandomCharacters or customAlphabets.
If you do not care about this warning make the receiveCollisionWarnings parameter false.''');

final insufficientAlphabetError = ArgumentError(
  'tiny_ids customAlphabets must have at least 2 distinct characters',
);
