import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../infrastructure/theme/dark_theme.dart';
import '../../../infrastructure/theme/light_theme.dart';
import '../../../infrastructure/theme/provider/theme_provider.dart';
import '../../../infrastructure/theme/theme_type.dart';
import '../../../infrastructure/utils/font_util.dart';
import '../../../infrastructure/utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) => Drawer(
        child: SafeArea(
          child: Consumer<ThemeProvider>(
            builder: (
              final _,
              final provider,
              final ___,
            ) =>
                Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Utils.largeVerticalSpacer,
                  const Text('App Font Size :'),
                  Center(
                    child: _fontSizeSlider(
                      current: provider.currentFontSliderValue,
                      onChanged: provider.changeFontSize,
                    ),
                  ),
                  Utils.largeVerticalSpacer,
                  const Text('App Font Type :'),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<FontEnum>(
                            value: FontEnum.quickSand,
                            title: const Text('quicksand'),
                            groupValue: provider.fontUtil.font,
                            onChanged: (final value) {
                              provider.changeFontFamily(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<FontEnum>(
                            value: FontEnum.athene,
                            title: const Text('inter'),
                            groupValue: provider.fontUtil.font,
                            onChanged: (final value) {
                              provider.changeFontFamily(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Utils.mediumVerticalSpacer,
                  const Text('App Theme :'),
                  Utils.mediumVerticalSpacer,
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            value: ThemeType.light,
                            title: const Text('Light'),
                            groupValue: provider.currentThemeType,
                            onChanged: (final value) {
                              provider.changeAppTheme(
                                LightTheme(provider.currentBlindnessType.type),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<ThemeType>(
                            value: ThemeType.dark,
                            title: const Text('Dark'),
                            groupValue: provider.currentThemeType,
                            onChanged: (final value) {
                              provider.changeAppTheme(
                                DarkTheme(provider.currentBlindnessType.type),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Utils.mediumVerticalSpacer,
                  Utils.mediumVerticalSpacer,
                ],
              ),
            ),
          ),
        ),
      );

  Widget _fontSizeSlider({
    required final double current,
    required final void Function(double value) onChanged,
  }) =>
      SfSlider(
        min: 1.0,
        max: 5.0,
        value: current,
        interval: 1,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        minorTicksPerInterval: 0,
        stepSize: 1,
        onChanged: (dynamic value) {
          onChanged.call(value);
        },
      );
}
