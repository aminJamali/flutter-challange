import 'package:flutter/material.dart';

import '../repository/select_seat_repository.dart';

class SelectSeatProvider extends ChangeNotifier {
  final List<List<int>> seats = [];
  final SelectSeatRepository _repository = SelectSeatRepository();

  Future<void> getSeats() async {
    final result = await _repository.getSeats();

    result.fold(
      (l) => null,
      (r) {
        seats.clear();
        seats.addAll(r);
      },
    );
    notifyListeners();
  }
}
