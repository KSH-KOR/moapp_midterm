import 'package:flutter/material.dart';
import 'package:midterm/model/hotel.dart';

class FavoritedHotelView extends StatefulWidget {
  const FavoritedHotelView({Key? key}) : super(key: key);

  @override
  State<FavoritedHotelView> createState() => _FavoritedHotelViewState();
}

class _FavoritedHotelViewState extends State<FavoritedHotelView> {
  late final HotelBook _hotelBook;

  @override
  void initState() {
    _hotelBook = HotelBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Hotel> favoritedHotels = _hotelBook.favoritedHotelBook;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Hotels'),
      ),
      body: favoritedHotels.isEmpty
          ? const Center(
              child: Text('empty'),
            )
          : FavoritedHotelList(
              hotels: favoritedHotels,
            ),
    );
  }
}

class FavoritedHotelList extends StatefulWidget {
  const FavoritedHotelList({Key? key, required this.hotels}) : super(key: key);
  final List<Hotel> hotels;

  @override
  State<FavoritedHotelList> createState() => _FavoritedHotelListState();
}

class _FavoritedHotelListState extends State<FavoritedHotelList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.hotels.length,
      itemBuilder: (context, index) {
        final item = widget.hotels[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item.id.toString()),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          background: Container(color: Colors.red),

          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              widget.hotels.removeAt(index);
              item.isFavorited = false;
            });
            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          child: ListTile(
            title: Text(item.name),
          ),
        );
      },
    );
  }
}
