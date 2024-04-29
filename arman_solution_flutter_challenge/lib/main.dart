import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/infrastructure/router/router.dart';
import 'src/infrastructure/theme/provider/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (final _) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Consumer<ThemeProvider>(
        builder: (final _, final provider, final __) => MaterialApp(
          title: 'Arman So.',
          theme: provider.baseTheme.createTheme(provider.fontUtil),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      );
}
