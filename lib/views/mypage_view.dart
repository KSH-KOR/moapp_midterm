import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:midterm/constant/routes.dart';
import 'package:midterm/model/hotel.dart';
import 'package:midterm/utils/helpers.dart';

import '../card/card_for_favhotel.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    final HotelBook hotelBook = HotelBook();

    return Scaffold(
      appBar: AppBar(title: const Text('My Page')),
      body: ListView(
        children: [
          Column(
            children: [
              addVerticalSpace(20),
              ClipOval(
                child: Container(
                  color: Colors.amberAccent,
                  child: Lottie.asset('assets/lottie/multitasking.json',
                      width: 200, height: 200, fit: BoxFit.cover),
                ),
              ),
              addVerticalSpace(20),
              const Text(
                '김신후',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              addVerticalSpace(10),
              const Text(
                '21900136',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ],
          ),
          addVerticalSpace(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'My Favorite Hotel List',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          hotelBook.favoritedHotelBook.isEmpty ? 
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(child: Text('Empty'),),
          ) :
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            physics: const ClampingScrollPhysics(),
            itemCount: hotelBook.favoritedHotelBook.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushNamed(context, detailRoute, arguments: hotelBook.favoritedHotelBook[index]);
                    },
                    child: MyPageHotelCard(
                        hotel: hotelBook.favoritedHotelBook[index],
                      ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

