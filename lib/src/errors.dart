final lengthTooSmallError = ArgumentError('''
flex_id cannot generate ids with the given parameters. The parameter "length" seems to be too small for the ids you want to generate. Try adjusting other parameters to generate ids with the given length.''');

final insufficientAlphabetError = ArgumentError(
  'customAlphabets must have at least 2 distinct characters',
);
