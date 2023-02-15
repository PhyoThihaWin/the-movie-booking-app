import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/booking_chair_page.dart';
import 'package:moviebooking/page/booking/booking_cinema_page.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/page/auth/pick_region_page.dart';
import 'package:moviebooking/page/movies/movie_detail_page.dart';
import 'package:moviebooking/page/movies/movies_page.dart';
import 'package:moviebooking/page/splash_page.dart';
import 'package:moviebooking/resource/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        primaryColor: PRIMARY_COLOR,
        primarySwatch: PRIMARY_COLOR_MATERIAL,
      ),
      home: HomePage(),
    );
  }
}
