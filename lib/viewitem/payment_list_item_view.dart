import 'package:flutter/material.dart';
import 'package:moviebooking/page/payment/ticket_confirmation_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

class PaymentListItemView extends StatelessWidget {
  const PaymentListItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MARGIN_10),
      child: RippleTap(
        onTap: () {
          context.next(const TicketConfirmationPage());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
            border: Border.all(color: TEXT_GREY_COLOR.withOpacity(0.4)),
          ),
          padding: EdgeInsets.all(MARGIN_MEDIUM_2),
          child: Row(
            children: [
              Image.asset(
                "ic_gift_payment.png".toAssetIcon(),
                width: MARGIN_XLARGE,
                color: Colors.white,
              ),
              SizedBox(width: MARGIN_MEDIUM_2),
              Text(
                "Gift Vouncher",
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
