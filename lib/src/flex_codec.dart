import 'dart:convert';

class FlexCodec extends Codec<String, String> {
  final String characters;

  const FlexCodec({required this.characters});

  @override
  // TODO: implement decoder
  Converter<String, String> get decoder => throw UnimplementedError();

  @override
  // TODO: implement encoder
  Converter<String, String> get encoder => throw UnimplementedError();
}

class _FlexEncoder extends Converter<String, String> {
  @override
  String convert(String input) {
    // TODO: implement convert
    throw UnimplementedError();
  }
}

class _FlexDecoder extends Converter<String, String> {
  @override
  String convert(String input) {
    // TODO: implement convert
    throw UnimplementedError();
  }
}
