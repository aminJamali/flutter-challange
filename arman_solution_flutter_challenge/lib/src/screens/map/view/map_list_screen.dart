import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/router/route_names.dart';
import '../../settings/view/settings_screen.dart';
import '../provider/map_provider.dart';
import 'widgets/map_list_item.dart';

class MapListScreen extends StatefulWidget {
  const MapListScreen({super.key});

  @override
  State<MapListScreen> createState() => _MapListScreenState();
}

class _MapListScreenState extends State<MapListScreen> {
  late final MapProvider mapProvider;

  @override
  void initState() {
    mapProvider = context.read<MapProvider>();
    mapProvider.getAllMaps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SettingsScreen(),
        appBar: AppBar(
          title: const Text('Maps'),
        ),
        body: SafeArea(
          child: Consumer<MapProvider>(
            builder: (final _, final provider, final __) => ListView.builder(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              itemCount: provider.maps.length,
              itemBuilder: (final _, final index) => MapListItem(
                item: mapProvider.maps[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.selectSeat,
                  );
                },
              ),
            ),
          ),
        ),
      );
}
