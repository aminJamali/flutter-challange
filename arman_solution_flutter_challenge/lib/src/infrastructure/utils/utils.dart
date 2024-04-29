import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../theme/base_theme.dart';
import '../theme/provider/theme_provider.dart';

class Utils {
  static const double smallWidth = 576;
  static const double mediumWidth = 768;
  static const double largeWidth = 992;
  static const double extraLargeWidth = 1200;

  static const double smallSize = 15;
  static const double mediumSize = 20;
  static const double largeSize = 30;
  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double semiLargeSpace = 12;
  static const double largeSpace = 16;
  static const double giantSpace = 32;
  static const double maxCrossAxisExtent = 100;
  static const double smallMaxCrossAxisExtent = 80;
  static const double maxWith = 700;
  static const tinyVerticalSpacer = SizedBox(height: Utils.tinySpace);
  static const smallVerticalSpacer = SizedBox(height: Utils.smallSpace);
  static const mediumVerticalSpacer = SizedBox(height: Utils.mediumSpace);
  static const largeVerticalSpacer = SizedBox(height: Utils.largeSpace);
  static const giantVerticalSpacer = SizedBox(height: Utils.giantSpace);

  static const tinyHorizontalSpacer = SizedBox(width: Utils.tinySpace);
  static const smallHorizontalSpacer = SizedBox(width: Utils.smallSpace);
  static const mediumHorizontalSpacer = SizedBox(width: Utils.mediumSpace);
  static const largeHorizontalSpacer = SizedBox(width: Utils.largeSpace);
  static const giantHorizontalSpacer = SizedBox(width: Utils.giantSpace);

  static const mediumPadding = EdgeInsetsDirectional.all(mediumSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const giantPadding = EdgeInsetsDirectional.all(giantSpace);

  static const normalRadius = BorderRadius.all(
    Radius.circular(mediumSpace),
  );

  static void toast({
    required final String msg,
    required final BuildContext context,
    final Color? backgroundColor,
  }) {
    BotToast.showText(
      text: msg,
      align: Alignment.topCenter,
      duration: const Duration(seconds: 2),
      onlyOne: true,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      contentPadding: const EdgeInsets.all(10),
      contentColor: Utils.getBaseTheme(context).primarySwatch,
      crossPage: true,
      textStyle:
          TextStyle(color: Utils.getBaseTheme(context).scaffoldBackgroundColor),
    );
  }

  static BaseTheme getBaseTheme(final BuildContext context) =>
      context.read<ThemeProvider>().baseTheme;

  static Widget loading({final Color? color}) =>
      LoadingAnimationWidget.staggeredDotsWave(
        size: 27,
        color: color ?? Colors.white,
      );
}
