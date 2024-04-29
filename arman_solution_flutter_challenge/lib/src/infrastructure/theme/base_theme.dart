import 'package:flutter/material.dart';

import '../utils/font_util.dart';
import 'app_color_blindness.dart';

abstract class BaseTheme {
  String currentFontFamily = 'Quicksand';

  MaterialColor primarySwatch = const MaterialColor(0xFF10AC84, <int, Color>{
    50: Color(0xff0e9b77),
    100: Color(0xff0d8a6a),
    200: Color(0xff0b785c),
    300: Color(0xff0a674f),
    400: Color(0xff085642),
    500: Color(0xff064535),
    600: Color(0xff053428),
    700: Color(0xff03221a),
    800: Color(0xff02110d),
    900: Color(0xff000000),
  });
  Color secondaryColor = const Color(0xff000000);
  Color successColor = const Color(0xff08C94F);
  Color warningColor = const Color(0xffF8833E);
  Color dangerColor = const Color(0xffDC2626);
  Color infoColor = const Color(0xff0D93F9);

  Color white = Colors.white;
  Color black = Colors.black;

  Color bookedColor = const Color(0xff82828F);
  Color endColor = const Color(0xff008299);

  Color chipBackgroundColor = const Color(0xffFFD7D5);
  Color chipBackgroundColor2 = const Color(0xffE2E8F0);
  Color iconBackgroundColor = const Color(0xffCAE3FE);
  Color textColor = const Color(0xff000000);
  Color textInputBorderColor = Colors.black54;
  Color scaffoldBackgroundColor = const Color(0xffEBEBEB);
  Color appbarBackgroundColor = const Color(0xffEBEBEB);
  Color cardColor = Colors.white;
  Color communicationMineItemColor = const Color(0xffD9FDD3);
  Color communicationOthersItemColor = const Color(0xffffffff);
  Color borderColor = const Color(0xffd3d3d3);
  Color communicationMaskedColor = Colors.blue.shade100;
  Color disabledColor = Colors.grey.withOpacity(.8);

  ThemeData createTheme(
    FontUtil fontUtil,
  );

  void changeColorBlindnessType(final ColorBlindnessType type);

  TextTheme textTheme(FontUtil fontUtil, final Color color) => TextTheme(
        displayLarge: TextStyle(
          fontSize: fontUtil.displayLarge,
          color: color,
        ),
        displayMedium: TextStyle(
          fontSize: fontUtil.displayMedium,
          color: color,
        ),
        displaySmall: TextStyle(
          fontSize: fontUtil.displaySmall,
          color: color,
        ),
        headlineLarge: TextStyle(
          fontSize: fontUtil.headlineLarge,
          color: color,
        ),
        headlineMedium: TextStyle(
          fontSize: fontUtil.headlineMedium,
          color: color,
        ),
        headlineSmall: TextStyle(
          fontSize: fontUtil.headlineSmall,
          color: color,
        ),
        titleLarge: TextStyle(
          fontSize: fontUtil.titleLarge,
          color: color,
        ),
        titleMedium: TextStyle(
          fontSize: fontUtil.titleMedium,
          letterSpacing: 0.15,
          color: color,
        ),
        titleSmall: TextStyle(
          fontSize: fontUtil.titleSmall,
          letterSpacing: 0.1,
          color: color,
        ),
        labelLarge: TextStyle(
          fontSize: fontUtil.labelLarge,
          letterSpacing: 0.1,
          color: color,
        ),
        labelMedium: TextStyle(
          fontSize: fontUtil.labelMedium,
          letterSpacing: 0.5,
          color: color,
        ),
        labelSmall: TextStyle(
          fontSize: fontUtil.labelSmall,
          letterSpacing: 0.5,
          color: color,
        ),
        bodyLarge: TextStyle(
          fontSize: fontUtil.bodyLarge,
          letterSpacing: 0.15,
          color: color,
        ),
        bodyMedium: TextStyle(
          fontSize: fontUtil.bodyMedium,
          letterSpacing: 0.25,
          color: color,
        ),
        bodySmall: TextStyle(
          fontSize: fontUtil.bodySmall,
          letterSpacing: 0.4,
        ),
      );
}
