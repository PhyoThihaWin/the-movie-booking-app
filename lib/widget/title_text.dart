import 'package:flutter/material.dart';

import '../resource/dimens.dart';

class TitleText extends StatelessWidget {
  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white,
          fontSize: TEXT_REGULAR,
          fontWeight: FontWeight.bold),
    );
  }
}
