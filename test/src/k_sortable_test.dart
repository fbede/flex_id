import 'package:test/test.dart';
import 'package:tiny_id/src/k_sortable.dart';

void main() {
  test('Checks that the timestamps are properly generated on native', () {
    const sortables = KSortable.values;

    for (final e in sortables) {
      if (e == KSortable.none) return;

      final timestampLength = e.generateTimestamp(false).toString().length;

      //an extra digit was added to timestampLength to let it generate to more
      //than year 5000 AD.
      expect(e.timestampLength, timestampLength - 1);
    }
  });

  test('Checks that the timestamps are properly generated on web', () {
    const sortables = KSortable.values;

    for (final e in sortables) {
      if (e == KSortable.none) return;

      final timestampLength = e.generateTimestamp(true).toString().length;

      //an extra digit was added to timestampLength to let it generate to more
      //than year 5000 AD.
      expect(e.timestampLength, timestampLength - 1);
    }
  });
}
