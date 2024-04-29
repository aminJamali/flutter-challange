import 'package:flutter/material.dart';

import '../model/map_model.dart';
import '../repository/map_repository.dart';

class MapProvider extends ChangeNotifier {
  final _repository = MapRepository();
  final List<MapModel> maps = [];

  Future<void> getAllMaps() async {
    final result = await _repository.getAllMaps();

    result.fold(
      (l) => null,
      (r) {
        maps.clear();
        maps.addAll(r);
      },
    );
    notifyListeners();
  }
}
