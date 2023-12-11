import 'dart:math';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flex_id/flex_id.dart';
import 'package:flex_id/src/alphabets.dart';
import 'package:flex_id/src/precision.dart';
import 'package:test/test.dart';

void main() {
  test('test name', () {
    final flex =
        FlexID.custom(symbols: '0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣🅰🅱🆎🅾🅿');

    /*  print(Precision.millisecond.timeStampBits(
        '😀🙂🤗😘😍😍😎😶😪😫😛😌😉😙😐😌😴🥱👨‍🦰👧🧓🧔👮‍♀️🎅🕵️‍♀️👮‍♂️👳‍♀️👶🎎✨🎉🎊🎃🎭🎨🥽🦺')); */

    print(flex.nextId);
    //  print(flex.nextId);
    //  print(flex.nextId);
    //  print(flex.nextId);
    // print(flex.nextId);
  });
}
