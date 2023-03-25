import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/strings.dart';
import 'package:moviebooking/utils/ext.dart';

import '../data/model/movie_booking_model.dart';
import '../data/model/movie_booking_model_impl.dart';
import '../resource/dimens.dart';

class CinemaGridItemView extends StatelessWidget {
  final Timeslots timeslots;
  final Function onLongPress;

  CinemaGridItemView(this.timeslots, this.onLongPress);

  @override
  Widget build(BuildContext context) {
    final MovieBookingModel movieBookingModel = MovieBookingModelImpl();

    var config =
        movieBookingModel.getTimeSlotConfigFromDb(timeslots.status.orZero);
    var bgColor = HexColor.fromHex((config?.color).orEmpty);
    // var textColor = Colors.red;

    return InkWell(
      onLongPress: () {
        onLongPress();
      },
      child: Container(
        decoration: BoxDecoration(
            color: bgColor.withOpacity(0.1),
            border: Border.all(color: bgColor),
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeslots.startTime.orEmpty,
              style: TextStyle(
                color: bgColor,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "3D IMAX",
              style: TextStyle(
                color: bgColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "Screen 1",
              style: TextStyle(
                color: bgColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              timeslots.status.orZero.toString(),
              style: TextStyle(
                color: bgColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getContainerBgColor(String available) {
    Color bgColor;
    switch (available) {
      case CINEMA_AVAILABLE:
        bgColor = Colors.green;
        break;
      case CINEMA_FILLING_FAST:
        bgColor = Colors.orange.shade700;
        break;
      case CINEMA_ALMOST_FULL:
        bgColor = Colors.pinkAccent;
        break;
      default:
        bgColor = TEXT_GREY_COLOR;
        break;
    }
    return bgColor;
  }

  Color getTextColor(String available) {
    Color bgColor;
    switch (available) {
      case CINEMA_SOLD_OUT:
        bgColor = TEXT_GREY_COLOR;
        break;
      default:
        bgColor = Colors.white;
        break;
    }
    return bgColor;
  }
}
