import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class TicketCountRichTextView extends StatelessWidget {
  final double fontSize;
  final int count;

  TicketCountRichTextView(
      {this.fontSize = TEXT_REGULAR_2X, required this.count});

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
              text: count.toString(),
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
