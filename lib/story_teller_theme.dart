import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryTellerTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ElevatedButtonThemeData elevatedLightButtonStyle =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(250, 50),
        backgroundColor: const Color.fromARGB(255, 150, 37, 255),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        // elevation: 10,
        textStyle: lightTextTheme.headline2),
  );

  static ElevatedButtonThemeData elevatedDarkButtonStyle =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(250, 50),
        backgroundColor: const Color.fromARGB(255, 150, 37, 255),
        shadowColor: const Color.fromARGB(255, 3, 3, 3),
        // elevation: 10,
        textStyle: lightTextTheme.headline2),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 150, 37, 255),
      ),
      textTheme: lightTextTheme,
      elevatedButtonTheme: elevatedLightButtonStyle,
      chipTheme: lightChipTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 37, 255),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 150, 37, 255),
      ),
      textTheme: darkTextTheme,
      elevatedButtonTheme: elevatedDarkButtonStyle,
      chipTheme: darkChipTheme,
    );
  }

  static ChipThemeData lightChipTheme = ChipThemeData(
      backgroundColor: const Color.fromARGB(255, 106, 106, 106),
      selectedColor: const Color.fromARGB(255, 150, 37, 255),
      labelStyle: darkTextTheme.bodyText1);

  static ChipThemeData darkChipTheme = ChipThemeData(
      backgroundColor: const Color.fromARGB(255, 106, 106, 106),
      selectedColor: const Color.fromARGB(255, 150, 37, 255),
      labelStyle: darkTextTheme.bodyText1);
}
