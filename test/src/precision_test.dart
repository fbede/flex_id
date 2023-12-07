import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:test/test.dart';
import 'package:tiny_id/src/precision.dart';

void main() {
  test('test name', () {
    print(Precision.millisecond.timestamp);
    print(Uint8List.fromList(
        Int64(Precision.millisecond.timestamp).toBytes().reversed.toList()));
  });
}
