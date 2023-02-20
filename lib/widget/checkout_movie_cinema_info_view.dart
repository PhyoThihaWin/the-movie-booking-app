import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/dimens.dart';

class CheckoutMovieCinemaInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _MovieCinemaInfoView(
            "ic_calendar.png",
            "Sat, 18 Jun, 2022",
          ),
        ),
        Expanded(
            child: _MovieCinemaInfoView(
          "ic_time.png",
          "3:30PM",
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
