import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class TicketCountRichTextView extends StatelessWidget {
  final double fontSize;

  TicketCountRichTextView({this.fontSize = TEXT_REGULAR_2X});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'M-Ticket(',
        style: TextStyle(
          color: TEXT_GREY_COLOR,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '2',
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(text: ')'),
        ],
      ),
    );
  }
}
