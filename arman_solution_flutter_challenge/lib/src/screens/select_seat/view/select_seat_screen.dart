import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/utils/utils.dart';
import '../provider/select_seat_provider.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  late final SelectSeatProvider seatProvider;

  @override
  void initState() {
    seatProvider = context.read<SelectSeatProvider>();
    seatProvider.getSeats();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Field Map'),
        ),
        body: SafeArea(
          child: Consumer<SelectSeatProvider>(
            builder: (final _, final provider, final __) => Column(
              children: [
                Utils.largeVerticalSpacer,
                Utils.largeVerticalSpacer,
                const Text('This side is the field'),
                Utils.mediumVerticalSpacer,
                 Divider(
                  color: Utils.getBaseTheme(context).disabledColor,
                ),
                const SizedBox(
                  height: 50,
                ),
                _seats(provider),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.grey.shade400,
                    ),
                    Utils.mediumHorizontalSpacer,
                    const Text('Reserved by others'),
                    Utils.largeHorizontalSpacer,
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.lightGreenAccent.shade400,
                    ),
                    Utils.mediumHorizontalSpacer,
                    const Text('Selected by you'),
                  ],
                ),
                Utils.mediumVerticalSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.lightGreenAccent.shade400,
                        ),
                      ),
                    ),
                    Utils.mediumHorizontalSpacer,
                    const Text('Available'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _seats(SelectSeatProvider provider) => SizedBox(
        height: 300,
        child: provider.seats.isEmpty
            ? const SizedBox.shrink()
            : SeatLayoutWidget(
                onSeatStateChanged: (final row, final col, final seatState) {},
                stateModel: SeatLayoutStateModel(
                  rows: provider.seats.length,
                  cols: provider.seats.first.length,
                  seatSvgSize: 30,
                  pathDisabledSeat: 'assets/svg_disabled_bus_seat.svg',
                  pathSelectedSeat: 'assets/svg_selected_bus_seats.svg',
                  pathSoldSeat: 'assets/svg_sold_bus_seat.svg',
                  pathUnSelectedSeat: 'assets/svg_unselected_bus_seat.svg',
                  currentSeatsState: provider.seats
                      .map(
                        (e) => e
                            .map(
                              (e) => e == 0
                                  ? SeatState.unselected
                                  : SeatState.disabled,
                            )
                            .toList(),
                      )
                      .toList(),
                ),
              ),
      );
}
