import 'package:flutter/material.dart';

const String appVersion = '0.0.1';

const Color kPrimaryColor = Color(0xff283046);
const Color kPrimaryColorDark = Color(0xff283046);

const Color kAppbarColor = Color(0xfff3a110);

const Color kAccentColor = Color(0xffffffff);
const Color kAccentColorDark = Color(0xff283046);

const Color kNavDrawerColor = kPrimaryColor;
const Color kNavDrawerColorDark = Color(0xff283046);

const Color kErrorColor = Color(0xffea5455);
const Color kTextColor = Color(0xff8d899c);
const Color kBottomNavColor = Color(0xffffffff);

const Color kBackgroundColor = Color(0xffffffff);
const Color kBackgroundColorDark = Color(0xff161d31);

const Color kShadowColor = Colors.black12;
const Color kShadowColorDark = Colors.black12;

//colors

// this extention is to get the color from the Hex without using 0xff
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
