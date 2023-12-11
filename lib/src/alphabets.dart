enum Alphabets {
  /// Binary numeral system
  binary('01'),

  /// Ternary numeral system
  ternary('012'),

  /// Quaternary numeral system
  quaternary('0123'),

  /// Quinary numeral system
  quinary('01234'),

  /// Senary numeral system
  senary('012345'),

  /// Octal numeral system
  octal('01234567'),

  /// Decimal numeral system
  decimal('0123456789'),

  /// Duodecimal numeral system
  duodecimal('0123456789AB'),

  /// Hexadecimal numeral system
  hexadecimal('0123456789ABCDEF'),

  /// Base32 numeral system
  base32('ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'),

  /// Base32 (Extended Hex) numeral system
  base32hex('0123456789ABCDEFGHIJKLMNOPQRSTUV'),

  /// Base36 numeral system
  base36('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'),

  /// Base58 numeral system
  base58('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'),

  /// Base62 numeral system
  base62('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'),

  /// Base64 numeral system
  base64('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'),

  /// Base64 (URL and Filename safe) numeral system
  base64url('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_');

  const Alphabets(this.characters);

  final String characters;

  /// Same as [binary] numeral system
  static Alphabets base2 = binary;

  /// Same as [ternary] numeral system
  static Alphabets base3 = ternary;

  /// Same as [quaternary] numeral system
  static Alphabets base4 = quaternary;

  /// Same as [quinary] numeral system
  static Alphabets base5 = quinary;

  /// Same as [senary] numeral system
  static Alphabets base6 = senary;

  /// Same as [octal] numeral system
  static Alphabets base8 = octal;

  /// Same as [decimal] numeral system
  static Alphabets base10 = decimal;

  /// Same as [duodecimal] numeral system
  static Alphabets base12 = duodecimal;

  /// Same as [hexadecimal] numeral system
  static Alphabets base16 = hexadecimal;
}
