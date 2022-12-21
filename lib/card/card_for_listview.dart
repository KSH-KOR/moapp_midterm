import 'package:flutter/material.dart';
import 'package:midterm/card/card_properties.dart';
import 'package:midterm/utils/helpers.dart';

import '../model/hotel.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Hero(
          tag: hotel.id.toString(),
          child: Image.asset(
            hotel.fileAssetsAddress,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _image(),
            addHorizontalSpace(10),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardScore(
                    score: hotel.score,
                    isGridView: false,
                  ),
                  Text(
                    hotel.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    hotel.location,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CardMoreButton(hotel: hotel),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
