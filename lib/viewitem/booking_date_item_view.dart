import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';

import '../model/booking_date.dart';
import '../resource/dimens.dart';

class BookingDateItemView extends StatelessWidget {
  final BookingDate bookingDate;
  final int position;

  BookingDateItemView(this.bookingDate, this.position);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getScreenWidthBy(4.5),
      margin: const EdgeInsets.only(
        right: MARGIN_MEDIUM_2,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "bg_booking_date.png".toAssetImage(),
            color: (position == 0) ? PRIMARY_COLOR : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
            ),
            child: DateDateColumnView(bookingDate: bookingDate),
          ),
        ],
      ),
    );
  }
}

class DateDateColumnView extends StatelessWidget {
  const DateDateColumnView({
    Key? key,
    required this.bookingDate,
  }) : super(key: key);

  final BookingDate bookingDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: MARGIN_MEDIUM),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            bookingDate.dayName,
            style: TextStyle(
              color: Colors.black,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          bookingDate.monthName,
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          bookingDate.date,
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
