import 'package:flutter/material.dart';

import '../resource/dimens.dart';

class BookingAvailabilityInfoView extends StatelessWidget {
  final String itemText;
  final Color itemColor;

  BookingAvailabilityInfoView(this.itemText, this.itemColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MARGIN_MEDIUM,
          width: MARGIN_MEDIUM,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: itemColor,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          itemText,
          style: TextStyle(
            color: itemColor,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
