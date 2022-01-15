import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextTheme textThemeLight = GoogleFonts.robotoTextTheme(
  const TextTheme(
      bodyText1: TextStyle(color: Colors.black54),
      bodyText2: TextStyle(color: Colors.black54),
      headline1: TextStyle(color: Colors.black54),
      headline2: TextStyle(color: Colors.black54),
      headline3: TextStyle(
          color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: Colors.black54),
      headline5: TextStyle(
        color: Colors.black,
      ),
      headline6: TextStyle(color: Colors.black54)),
);

TextTheme textThemeDark = GoogleFonts.robotoTextTheme(
  const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white),
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white)),
);

ThemeData lightTheme(context) {
  return ThemeData(
      primaryColor: kPrimaryColor,
      accentColor: kAccentColor,
      backgroundColor: kBackgroundColor,
      scaffoldBackgroundColor: kBackgroundColor,
      appBarTheme: const AppBarTheme(color: kAppbarColor),
      errorColor: kErrorColor,
      shadowColor: kShadowColor,
      iconTheme: const IconThemeData(color: Colors.black45),
      textTheme: textThemeLight);
}

ThemeData darkTheme(context) {
  return ThemeData(
      primaryColor: kPrimaryColorDark,
      accentColor: kAccentColorDark,
      backgroundColor: kBackgroundColorDark,
      scaffoldBackgroundColor: kBackgroundColorDark,
      errorColor: kErrorColor,
      shadowColor: kShadowColorDark,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: textThemeDark);
}
