import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class AppBarSearchView extends StatelessWidget {
  const AppBarSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.search, color: Colors.white),
        Flexible(
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: HOME_SCREEN_BACKGROUND_COLOR,
                hintText: "Search the movie",
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
