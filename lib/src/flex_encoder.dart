import 'dart:convert';

import 'package:characters/characters.dart';

class FlexTimeEncoder extends Converter<List<int>, String> {
  final String characters;

  FlexTimeEncoder(this.characters);

  @override
  String convert(List<int> input) => List.generate(input.length, (index) {
        return characters.characters.characterAt(input[index]);
      }).join();
}
