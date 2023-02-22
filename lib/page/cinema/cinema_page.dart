import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/viewitem/cinema_parent_item_view.dart';

import '../../resource/strings.dart';

class CinemaPage extends StatelessWidget {
  List<String> cinemaList = [
    CINEMA_SOLD_OUT,
    CINEMA_SOLD_OUT,
    CINEMA_AVAILABLE,
    CINEMA_ALMOST_FULL,
    CINEMA_AVAILABLE,
    CINEMA_FILLING_FAST,
    CINEMA_AVAILABLE,
    CINEMA_FILLING_FAST
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => CinemaParentItemView(cinemaList),
      ),
    );
  }
}
