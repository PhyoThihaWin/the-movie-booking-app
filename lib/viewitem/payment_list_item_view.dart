import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/payment_type_vo.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

class PaymentListItemView extends StatelessWidget {
  final PaymentTypeVo paymentType;
  final Function onPaymentSelected;

  PaymentListItemView(
      {required this.paymentType, required this.onPaymentSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MARGIN_10),
      child: RippleTap(
        onTap: () {
          onPaymentSelected();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
            border: Border.all(color: TEXT_GREY_COLOR.withOpacity(0.4)),
          ),
          padding: EdgeInsets.all(MARGIN_MEDIUM_2),
          child: Row(
            children: [
              Image.network(
                paymentType.icon.orEmpty,
                width: MARGIN_XLARGE,
                color: Colors.white,
              ),
              SizedBox(width: MARGIN_MEDIUM_2),
              Text(
                paymentType.title.orEmpty,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
