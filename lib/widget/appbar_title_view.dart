import 'package:flutter/material.dart';

import '../resource/dimens.dart';

class AppBarTitleView extends StatelessWidget {
  final String titleText;
  final double fontSize;

  AppBarTitleView(this.titleText, {this.fontSize = TEXT_REGULAR_2X});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
