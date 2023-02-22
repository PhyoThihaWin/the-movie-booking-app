import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';

class BookingButtonView extends StatelessWidget {
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final Function btnClick;

  BookingButtonView(
      {required this.btnText,
      this.btnTextColor = Colors.black,
      this.btnColor = PRIMARY_COLOR,
      required this.btnClick});

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        btnClick();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "bg_booking_btn.png".toAssetImage(),
            color: btnColor,
            scale: 2,
          ),
          Text(
            btnText,
            style: TextStyle(
              color: btnTextColor,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
