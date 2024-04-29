import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/model/blindness_type.dart';
import '../../utils/font_util.dart';
import '../app_color_blindness.dart';
import '../base_theme.dart';
import '../light_theme.dart';
import '../theme_type.dart';

class ThemeProvider extends ChangeNotifier {
  final FontUtil fontUtil = FontUtil();

  double currentFontSliderValue = 1;

  ThemeType currentThemeType = ThemeType.light;
  BlindnessType currentBlindnessType = BlindnessType.none;

  BaseTheme baseTheme = LightTheme(ColorBlindnessType.none);
  late SharedPreferences preferences;

  Future<void> changeAppTheme(BaseTheme theme) async {
    if (theme is LightTheme) {
      currentThemeType = ThemeType.light;
    } else {
      currentThemeType = ThemeType.dark;
    }
    baseTheme = theme;
    preferences = await SharedPreferences.getInstance();
    await preferences.setBool(
        'isLightTheme', currentThemeType == ThemeType.light);

    notifyListeners();
  }

  Future<void> changeFontFamily(final FontEnum value) async {
    fontUtil.font = value;
    baseTheme.currentFontFamily = value.name;

    preferences = await SharedPreferences.getInstance();
    await preferences.setString('fontFamily',
        baseTheme.currentFontFamily == 'Quicksand' ? 'Quicksand' : 'Inter');

    notifyListeners();
  }

  void changeFontSize(final double value) {
    fontUtil.titleLarge = fontUtil.kTitleLarge;
    fontUtil.titleLarge =
        fontUtil.kTitleLarge + (fontUtil.kTitleLarge * (value * 0.05));

    fontUtil.titleMedium = fontUtil.kTitleMedium;
    fontUtil.titleMedium =
        fontUtil.kTitleMedium + (fontUtil.kTitleMedium * (value * 0.05));

    fontUtil.titleSmall = fontUtil.kTitleSmall;
    fontUtil.titleSmall =
        fontUtil.kTitleSmall + (fontUtil.kTitleSmall * (value * 0.05));

    fontUtil.displayLarge = fontUtil.kDisplayLarge;
    fontUtil.displayLarge =
        fontUtil.kDisplayLarge + (fontUtil.kDisplayLarge * (value * 0.05));

    fontUtil.displayMedium = fontUtil.kDisplayMedium;
    fontUtil.displayMedium =
        fontUtil.kDisplayMedium + (fontUtil.kDisplayMedium * (value * 0.05));

    fontUtil.displaySmall = fontUtil.kDisplaySmall;
    fontUtil.displaySmall =
        fontUtil.kDisplaySmall + (fontUtil.kDisplaySmall * (value * 0.05));

    fontUtil.bodyLarge = fontUtil.kBodyLarge;
    fontUtil.bodyLarge =
        fontUtil.kBodyLarge + (fontUtil.kBodyLarge * (value * 0.05));

    fontUtil.bodyMedium = fontUtil.kBodyMedium;
    fontUtil.bodyMedium =
        fontUtil.kBodyMedium + (fontUtil.kBodyMedium * (value * 0.05));

    fontUtil.bodySmall = fontUtil.kBodySmall;
    fontUtil.bodySmall =
        fontUtil.kBodySmall + (fontUtil.kBodySmall * (value * 0.05));

    fontUtil.headlineLarge = fontUtil.kHeadlineLarge;
    fontUtil.headlineLarge =
        fontUtil.kHeadlineLarge + (fontUtil.kHeadlineLarge * (value * 0.05));

    fontUtil.headlineMedium = fontUtil.kHeadlineMedium;
    fontUtil.headlineMedium =
        fontUtil.kHeadlineMedium + (fontUtil.kHeadlineMedium * (value * 0.05));

    fontUtil.headlineSmall = fontUtil.kHeadlineSmall;
    fontUtil.headlineSmall =
        fontUtil.kHeadlineSmall + (fontUtil.kHeadlineSmall * (value * 0.05));

    fontUtil.labelLarge = fontUtil.kLabelLarge;
    fontUtil.labelLarge =
        fontUtil.kLabelLarge + (fontUtil.kLabelLarge * (value * 0.05));

    fontUtil.labelMedium = fontUtil.kLabelMedium;
    fontUtil.labelMedium =
        fontUtil.kLabelMedium + (fontUtil.kLabelMedium * (value * 0.05));

    fontUtil.labelSmall = fontUtil.kLabelSmall;
    fontUtil.labelSmall =
        fontUtil.kLabelSmall + (fontUtil.kLabelSmall * (value * 0.05));
    currentFontSliderValue = value;
    notifyListeners();
  }
}
