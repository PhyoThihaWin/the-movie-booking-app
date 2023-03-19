import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';

import '../data/vos/booking_date.dart';
import '../resource/dimens.dart';

class BookingDateItemView extends StatelessWidget {
  final BookingDate bookingDate;
  final bool isSelected;
  final Function() onClickItem;

  BookingDateItemView(this.bookingDate, this.isSelected, this.onClickItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickItem();
      },
      child: Container(
        width: context.getScreenWidthBy(4.5),
        margin: const EdgeInsets.only(
          right: MARGIN_MEDIUM_2,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "bg_booking_date.png".toAssetImage(),
              color: isSelected ? PRIMARY_COLOR : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM,
              ),
              child: DateDateColumnView(bookingDate: bookingDate),
            ),
          ],
        ),
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
        SizedBox(height: MARGIN_6),
        Text(
          bookingDate.monthName,
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: MARGIN_6),
        Text(
          bookingDate.date,
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
