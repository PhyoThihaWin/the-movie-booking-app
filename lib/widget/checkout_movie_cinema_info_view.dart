import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../data/vos/checkout_request_vo.dart';
import '../data/vos/cinema_show_time_vo.dart';
import '../resource/dimens.dart';

class CheckoutMovieCinemaInfoView extends StatelessWidget {
  final String bookingDate;
  final String startTime;

  CheckoutMovieCinemaInfoView(
      {required this.bookingDate, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _MovieCinemaInfoView(
            "ic_calendar.png",
            bookingDate,
          ),
        ),
        Expanded(
            child: _MovieCinemaInfoView(
          "ic_time.png",
          startTime,
        )),
        Expanded(
            child: _MovieCinemaInfoView(
          "ic_location.png",
          "Baho St, BuTarYone Lann Bus stop, Hlaing",
        )),
      ],
    );
  }
}

class _MovieCinemaInfoView extends StatelessWidget {
  final String iconPath;
  final String itemString;

  _MovieCinemaInfoView(this.iconPath, this.itemString);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconPath.toAssetIcon(),
          height: MARGIN_MEDIUM_3,
          width: MARGIN_MEDIUM_3,
        ),
        const SizedBox(height: MARGIN_10),
        Text(
          itemString,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
