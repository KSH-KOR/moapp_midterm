import 'package:flutter/material.dart';

import '../model/hotel.dart';

class MyPageHotelCard extends StatelessWidget {
  const MyPageHotelCard({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Stack(
        children: [
          Image.asset(
            hotel.fileAssetsAddress,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: SizedBox(
              width: width - 100,
              child: Text(
                hotel.name,
                style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: SizedBox(
              width: width - 100,
              child: Text(
                hotel.location,
                style: const TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
