import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'booking_available_info_view.dart';

class QuantityControlView extends StatelessWidget {
  final Function? onClickPlus;
  final Function? onClickMinus;
  final int? qunatity;

  QuantityControlView({this.onClickPlus, this.onClickMinus, this.qunatity = 1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleDotView(
          itemColor: PRIMARY_COLOR,
          padding: MARGIN_SMALL,
          onTap: () {
            onClickPlus?.call();
          },
          child: const Icon(
            Icons.add,
            size: MARGIN_MEDIUM_2,
          ),
        ),
        const SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Text(
          qunatity.toString(),
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: MARGIN_CARD_MEDIUM_2),
        CircleDotView(
          itemColor: PRIMARY_COLOR,
          padding: MARGIN_SMALL,
          onTap: () {
            onClickMinus?.call();
          },
          child: const Icon(
            Icons.remove,
            size: MARGIN_MEDIUM_2,
          ),
        )
      ],
    );
  }
}
