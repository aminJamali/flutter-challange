import 'package:flutter/material.dart';

import '../../screens/login/view/login_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        RouteNames.login => MaterialPageRoute(
            builder: (final _) => const LoginScreen(),
          ),
        _ => MaterialPageRoute(
            builder: (final _) => const LoginScreen(),
          ),
      };
}
