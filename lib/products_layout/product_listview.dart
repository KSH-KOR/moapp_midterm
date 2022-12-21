import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/card/card_for_listview.dart';

import '../model/hotel.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  late final HotelBook _hotelBook;
  @override
  void initState() {
    _hotelBook = HotelBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _hotelBook.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListViewCard(hotel: _hotelBook.hotelBook[index]);
      },
    );
  }
}