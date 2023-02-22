import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

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
        _CustomHalfCircleView(
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
        _CustomHalfCircleView(
          isLeft: false,
          size: MARGIN_XXLARGE,
        ),
      ],
    );
  }
}

class _CustomHalfCircleView extends StatelessWidget {
  final bool isLeft;
  final double size;

  _CustomHalfCircleView({required this.isLeft, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size / 2,
        decoration: BoxDecoration(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          borderRadius: isLeft
              ? BorderRadius.only(
            topRight: Radius.circular(size),
            bottomRight: Radius.circular(size),
          )
              : BorderRadius.only(
            topLeft: Radius.circular(size),
            bottomLeft: Radius.circular(size),
          ),
        ));
  }
}
