import 'package:flutter/material.dart';

import '../card/card_for_gridview.dart';
import '../model/hotel.dart';


class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);
  
  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  late final HotelBook _hotelBook;
  @override
  void initState() {
    _hotelBook = HotelBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.builder(
          itemCount: _hotelBook.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (width < height) ? 2 : 3,
              childAspectRatio: 8.0 / 9.0),
          itemBuilder: (context, index) {
            final Hotel hotel = _hotelBook.hotelBook[index];
            return  GridViewCard(
                hotel: hotel,
            );
          },
        );
      },
    );
  }
}
