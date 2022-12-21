import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../model/hotel.dart';

class CardScore extends StatelessWidget {
  const CardScore({Key? key, required this.score, required this.isGridView})
      : super(key: key);

  final int score;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        score,
        (index) => Icon(
          Icons.star_outlined,
          color: Colors.yellow,
          size: isGridView ? 15.0 : 20.0,
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({Key? key, required this.title, required this.isGridView})
      : super(key: key);

  final String title;
  final bool isGridView;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: isGridView ? 15 : 20),
    );
  }
}

class CardMoreButton extends StatelessWidget {
  const CardMoreButton({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () async {
        await Navigator.pushNamed(context, detailRoute, arguments: hotel);
      },
      child: const Text('more', style: TextStyle(color: Colors.blue)),
    );
  }
}
