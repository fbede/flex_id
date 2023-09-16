final maxLengthTooSmallError = ArgumentError('''
Cannot generate ids with the given parameters. Parameter "max length" seems to be too small.
Try adjusting other parameters to generate ids with the given length.''');

final unsupportedSortableCase = UnsupportedError(
  'This case should never be called for this kSortable type',
);
