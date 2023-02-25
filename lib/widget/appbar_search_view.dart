import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class AppBarSearchView extends StatelessWidget {
  final Function onSubmit;
  final String title;

  AppBarSearchView(this.title, this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.search, color: Colors.white),
        Flexible(
          child: TextField(
            onSubmitted: (text) {
              print("Fucccc");
              onSubmit();
            },
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: HOME_SCREEN_BACKGROUND_COLOR,
                hintText: title,
                hintStyle: TextStyle(
                  color: TEXT_GREY_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                ),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
