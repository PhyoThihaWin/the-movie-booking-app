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
        CircleDotView(itemColor: itemColor),
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

class CircleDotView extends StatelessWidget {
  final Color itemColor;
  final double? size;
  final Widget? child;
  final double? padding;

  CircleDotView({required this.itemColor, this.size, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: child == null ? size ?? MARGIN_MEDIUM : null,
      width: child == null ? size ?? MARGIN_MEDIUM : null,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: itemColor,
      ),
      child: child,
    );
  }
}
