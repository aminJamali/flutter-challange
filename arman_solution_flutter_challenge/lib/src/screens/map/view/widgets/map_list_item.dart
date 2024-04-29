import 'package:flutter/material.dart';

import '../../model/map_model.dart';

class MapListItem extends StatelessWidget {
  final MapModel item;

  const MapListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
