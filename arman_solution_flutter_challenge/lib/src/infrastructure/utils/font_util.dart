

import '../theme/app_color_blindness.dart';

class FontUtil {
  // --------------------->Display<------------------------

  final double kDisplayLarge = 57;
  final double kDisplaySmall = 36;
  final double kDisplayMedium = 45;

  double displayLarge = 57;
  double displaySmall = 36;
  double displayMedium = 45;

  // --------------------->Headline<------------------------
  final double kHeadlineLarge = 32;
  final double kHeadlineMedium = 28;
  final double kHeadlineSmall = 24;

  double headlineLarge = 32;
  double headlineMedium = 28;
  double headlineSmall = 24;

  // --------------------->Title<------------------------
  final double kTitleLarge = 22;
  final double kTitleMedium = 12;
  final double kTitleSmall = 14;

  double titleLarge = 22;
  double titleMedium = 16;
  double titleSmall = 14;

  // --------------------->Label<------------------------
  final double kLabelLarge = 16;
  final double kLabelMedium = 14;
  final double kLabelSmall = 11;

  double labelLarge = 16;
  double labelMedium = 14;
  double labelSmall = 11;

  // --------------------->Body<------------------------
  final double kBodyLarge = 16;
  final double kBodyMedium = 14;
  final double kBodySmall = 12;

  double bodyLarge = 16;
  double bodyMedium = 14;
  double bodySmall = 12;

  FontEnum font = FontEnum.quickSand;

  ColorBlindnessType currentBlindnessType = ColorBlindnessType.none;
}

enum FontEnum {
  quickSand('Quicksand'),
  athene('Inter');

  final String path;

  const FontEnum(this.path);
}
