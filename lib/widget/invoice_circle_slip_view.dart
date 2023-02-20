import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../page/booking/booking_checkout_page.dart';
import '../resource/colors.dart';
import '../resource/dimens.dart';

class InvoiceCircleSlipView extends StatelessWidget {
  const InvoiceCircleSlipView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomHalfCircleView(
          isLeft: true,
          size: MARGIN_XXLARGE,
        ),
        const SizedBox(width: MARGIN_SMALL),
        Expanded(
            child: DottedLine(
          dashLength: MARGIN_10,
          dashColor: TEXT_GREY_COLOR.withOpacity(0.4),
          dashGapLength: MARGIN_SMALL,
        )),
        const SizedBox(width: MARGIN_SMALL),
        CustomHalfCircleView(
          isLeft: false,
          size: MARGIN_XXLARGE,
        ),
      ],
    );
  }
}
