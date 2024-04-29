import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/login/provider/login_provider.dart';
import '../../screens/login/view/login_screen.dart';
import '../../screens/map/provider/map_provider.dart';
import '../../screens/map/view/map_list_screen.dart';
import '../../screens/select_seat/provider/select_seat_provider.dart';
import '../../screens/select_seat/view/select_seat_screen.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        RouteNames.login => MaterialPageRoute(
            builder: (final _) => ChangeNotifierProvider(
              create: (final _) => LoginProvider(),
              child: const LoginScreen(),
            ),
          ),
        RouteNames.map => MaterialPageRoute(
            builder: (final _) => ChangeNotifierProvider(
              create: (final _) => MapProvider(),
              child: const MapListScreen(),
            ),
          ),
        RouteNames.selectSeat => MaterialPageRoute(
            builder: (final _) => ChangeNotifierProvider(
              create: (final _) => SelectSeatProvider(),
              child: const SelectSeatScreen(),
            ),
          ),
        _ => MaterialPageRoute(
            builder: (final _) => const LoginScreen(),
          ),
      };
}
