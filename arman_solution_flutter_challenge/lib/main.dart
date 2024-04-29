import 'package:flutter/material.dart';

import 'src/infrastructure/router/router.dart';
import 'src/infrastructure/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Arman So.',
        theme: AppTheme.getThemeData(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
}
