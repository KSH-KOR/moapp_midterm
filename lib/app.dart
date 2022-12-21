import 'package:flutter/material.dart';
import 'package:midterm/views/detail/product_detailed_view.dart';
import 'package:midterm/views/favorite_product_list_view.dart';
import 'package:midterm/views/mypage_view.dart';
import 'package:midterm/views/search_view.dart';
import 'package:midterm/views/signup_view.dart';

import 'constant/routes.dart';
import 'views/login_view.dart';
import 'views/homepage.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Midterm 김신후 21900136',
      initialRoute: loginRoute,
      routes: {
        detailRoute: (BuildContext context) => const DetailView(),
        signupRoute: (BuildContext context) => const SignupPage(),
        loginRoute: (BuildContext context) => const LoginPage(),
        homepageRoute: (BuildContext context) => const HomePage(),
        favoritedHotelRoute: (BuildContext context) => const FavoritedHotelView(),
        myPageRoute: (BuildContext context) => const MyPageView(),
        searchRoute: (BuildContext context) => const SearchView(),
      },
    );
  }
}