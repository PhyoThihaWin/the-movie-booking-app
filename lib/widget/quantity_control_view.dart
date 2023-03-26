import 'package:flutter/material.dart';

import '../data/vos/snack_vo.dart';
import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'booking_available_info_view.dart';

class QuantityControlView extends StatefulWidget {
  final SnackVo snackVo;
  final Function(SnackVo) onQtyChanged;

  QuantityControlView({required this.snackVo, required this.onQtyChanged});

  @override
  State<QuantityControlView> createState() => _QuantityControlViewState();
}

class _QuantityControlViewState extends State<QuantityControlView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleDotView(
          itemColor: PRIMARY_COLOR,
          padding: MARGIN_SMALL,
          onTap: () {
            setState(() {
              widget.snackVo.qty++;
              widget.onQtyChanged(widget.snackVo);
            });
          },
          child: const Icon(
            Icons.add,
            size: MARGIN_MEDIUM_2,
          ),
        ),
        const SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Text(
          widget.snackVo.qty.toString(),
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
            setState(() {
              if (widget.snackVo.qty > 0) {
                widget.snackVo.qty--;
                widget.onQtyChanged(widget.snackVo);
              }
            });
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
