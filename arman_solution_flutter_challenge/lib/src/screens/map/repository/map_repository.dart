import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../model/map_model.dart';

class MapRepository {
  Future<Either<Exception, List<MapModel>>> getAllMaps() async {
    try {
      final String response =
          await rootBundle.loadString('assets/get_all_maps.json');
      final data = await json.decode(response);

      data as List;

      return Right(
        data
            .map(
              (value) => MapModel.fromJson(value as Map<String, dynamic>),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
