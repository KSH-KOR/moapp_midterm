import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:midterm/card/card_properties.dart';
import 'package:midterm/model/hotel.dart';

import '../../utils/helpers.dart';


class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final HotelBook _hotelBook;

  @override
  void initState() {
    _hotelBook = HotelBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    final cardWidth = MediaQuery.of(context).size.width - 40;

    void _favoriteButton() {
      setState(() {
        hotel.isFavorited = !hotel.isFavorited;
        if(_hotelBook.favoritedHotelBook.contains(hotel)){
          _hotelBook.deleteFavoriteHotel(hotel);
        } else{
          _hotelBook.addFavoriteHotel(hotel);
        }
      });
    }

    Widget _image() {
      return InkWell(
        onDoubleTap: _favoriteButton,
        child: Stack(
          children: [
            SizedBox(
              width: 600,
              height: 240,
              child: Hero(
                tag: hotel.id.toString(),
                child: Image.asset(
                  hotel.fileAssetsAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  hotel.isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: hotel.isFavorited ? Colors.red : Colors.grey,
                  size: 30,
                ),
                onPressed: _favoriteButton,
              ),
            ),
          ],
        ),
      );
    }

    Widget _basicInfo({required String info, required Icon icon}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          addHorizontalSpace(10),
          SizedBox(
            width: cardWidth * (2.0 / 3.0),
            child: Text(info, style: const TextStyle(fontSize: 14)),
          ),
        ],
      );
    }

    Widget _description({required String text}) {
      return Text(
        text,
        softWrap: true,
        style: const TextStyle(height: 2),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail')),
        body: ListView(
          children: [
            _image(),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  CardScore(score: hotel.score, isGridView: false),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: cardWidth * (2.0 / 3.0),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            WavyAnimatedText(
                              hotel.name,
                              textStyle: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  _basicInfo(
                    info: hotel.location,
                    icon: const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                    ),
                  ),
                  addVerticalSpace(10),
                  _basicInfo(
                    info: hotel.contactNumber,
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                  ),
                  addVerticalSpace(10),
                  const Divider(height: 1.0, color: Colors.black),
                  addVerticalSpace(10),
                  _description(text: hotel.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
