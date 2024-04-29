import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

class SelectSeatRepository {
  Future<Either<Exception, List<List<int>>>> getSeats() async {
    try {
      final String response =
          await rootBundle.loadString('assets/get_map_seats.json');
      final data = await json.decode(response);

      data as List;
      final List<List<int>> items = [];
      for (final element in data) {
        items.add(
          [...List.from(element)],
        );
      }

      return Right(items);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
