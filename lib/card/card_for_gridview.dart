import 'package:flutter/material.dart';

import '../model/hotel.dart';
import 'card_properties.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 20.0 / 11.0,
        child: Hero(
          tag: hotel.id.toString(),
          child: Image.asset(
            hotel.fileAssetsAddress,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          _image(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardScore(
                  isGridView: true,
                  score: hotel.score,
                ),
                CardTitle(title: hotel.name, isGridView: true),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                    Flexible(
                      child: Text(
                        hotel.location,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CardMoreButton(hotel: hotel),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
