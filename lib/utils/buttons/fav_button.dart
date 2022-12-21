
/*Change the color of star icon (Color: yellow) and add interactivity to the 
star icon as guided in [Adding interactivity] doc*/
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = true;
  int favoriteCount = 41;
  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        favoriteCount++;
      } else {
        favoriteCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleFavorite,
      child: Container(
        decoration: const BoxDecoration(
        ),
        child: Row(
          children: [
            Icon(
              isFavorited ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            Text(
              favoriteCount.toString(),
            )
          ],
        ),
      ),
    );
  }
}
