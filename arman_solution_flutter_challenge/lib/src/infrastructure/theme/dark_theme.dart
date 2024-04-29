import 'package:flutter/material.dart';

import '../utils/font_util.dart';
import '../utils/utils.dart';
import 'app_color_blindness.dart';
import 'base_theme.dart';

class DarkTheme extends BaseTheme {
  DarkTheme(final ColorBlindnessType type) {
    changeColorBlindnessType(type);
  }

  @override
  ThemeData createTheme(
    final FontUtil fontUtil,
  ) =>
      ThemeData(
        primaryColor: primarySwatch,
        colorScheme: colorBlindnessColorScheme(
          ColorScheme.fromSwatch(
            primarySwatch: primarySwatch,
            accentColor: secondaryColor,
            backgroundColor: scaffoldBackgroundColor,
            cardColor: cardColor,
            errorColor: dangerColor,
          ),
          fontUtil.currentBlindnessType,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(width: 1, color: borderColor),
        ),
        fontFamily: currentFontFamily,
        disabledColor: disabledColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: textTheme(fontUtil, textColor),
        appBarTheme: AppBarTheme(
          backgroundColor: cardColor,
          elevation: 1,
        ),
        filledButtonTheme: _lightFilledButtonTheme(fontUtil),
        textButtonTheme: _lightFlatButtonTheme(fontUtil),
        floatingActionButtonTheme: lightFloatingActionButtonThemeData(),
        elevatedButtonTheme: lightElevatedButtonThemeData(),
        outlinedButtonTheme: lightOutlinedButtonThemeData(fontUtil),
        buttonTheme: lightButtonThemeData(),
        iconButtonTheme: lightIconButtonThemeData(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: cardColor,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((final states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.selected)) {
              return primarySwatch;
            }
            return textColor;
          }),
        ),
        inputDecorationTheme: _lightInputTheme(),
        listTileTheme: ListTileThemeData(
          iconColor: textColor,
        ),
        iconTheme: IconThemeData(
          color: textColor,
        ),
        cardColor: cardColor,
        dialogBackgroundColor: cardColor,
        drawerTheme: DrawerThemeData(
          backgroundColor: cardColor,
        ),
      );

  IconButtonThemeData lightIconButtonThemeData() => IconButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
              style: BorderStyle.solid,
              color: secondaryColor,
              width: 2,
            ),
          ),
        ),
      );

  ButtonThemeData lightButtonThemeData() => ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.accent,
        shape: const RoundedRectangleBorder(
          borderRadius: Utils.normalRadius,
        ),
      );

  OutlinedButtonThemeData lightOutlinedButtonThemeData(
    final FontUtil fontUtil,
  ) =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch).labelMedium!.copyWith(
                  fontSize: 16,
                  color: primarySwatch,
                ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              style: BorderStyle.solid,
              color: primarySwatch,
              width: 0.9,
            ),
          ),
        ),
      );

  ElevatedButtonThemeData lightElevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
          backgroundColor: secondaryColor,
          foregroundColor: cardColor,
        ),
      );

  FloatingActionButtonThemeData lightFloatingActionButtonThemeData() =>
      FloatingActionButtonThemeData(
        backgroundColor: primarySwatch,
        splashColor: cardColor,
        foregroundColor: cardColor,
      );

  InputDecorationTheme _lightInputTheme() => InputDecorationTheme(
        labelStyle: const TextStyle(fontSize: 50),
        suffixStyle: const TextStyle(fontSize: 50),
        hintStyle: const TextStyle(fontSize: 50),
        floatingLabelStyle: const TextStyle(fontSize: 50),
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 4, right: 4, top: 4),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primarySwatch,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: dangerColor,
          ),
        ),
      );

  FilledButtonThemeData _lightFilledButtonTheme(final FontUtil fontUtil) =>
      FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            primarySwatch,
          ),
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch).labelMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
          ),
        ),
      );

  TextButtonThemeData _lightFlatButtonTheme(final FontUtil fontUtil) =>
      TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          textStyle: MaterialStatePropertyAll(
            textTheme(fontUtil, primarySwatch)
                .titleSmall!
                .copyWith(color: Colors.blue),
          ),
        ),
      );

  @override
  void changeColorBlindnessType(final ColorBlindnessType type) {
    // primarySwatch =
    //     const Color(
    //       0xFF16A086,
    //     );

    chipBackgroundColor = colorBlindness(const Color(0xffFFD7D5), type);
    chipBackgroundColor2 = colorBlindness(const Color(0xffE2E8F0), type);
    iconBackgroundColor = colorBlindness(const Color(0xffCAE3FE), type);
    secondaryColor = colorBlindness(const Color(0xffBB86FC), type);
    // departColor = colorBlindness(const Color(0xff6F4FAA), type);
    textColor = const Color(0xffffffff);
    dangerColor = const Color(0xffEB3939);
    endColor = const Color(0xff008299);
    warningColor = const Color(0xffF57F17);
    scaffoldBackgroundColor = const Color(0xff121212);
    infoColor = const Color(0xff4F46E5);
    cardColor = const Color(0xff1E1E1E);
    communicationMineItemColor = const Color(0xff006A60);
    communicationOthersItemColor = const Color(0xffffffff);
    borderColor = const Color(0xffd3d3d3);
    communicationMaskedColor = Colors.blue.shade700;
    disabledColor = Colors.grey.withOpacity(.8);
    disabledColor = Colors.grey.shade200;
  }
}
