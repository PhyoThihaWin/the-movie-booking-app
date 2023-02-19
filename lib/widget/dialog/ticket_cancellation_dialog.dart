import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../common_button_view.dart';

class TicketCancellationDialog extends StatelessWidget {
  const TicketCancellationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: context.getScreenWidthBy(1.2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
            color: Colors.black,
            border: Border.all(color: PRIMARY_COLOR)),
        padding: const EdgeInsets.all(MARGIN_LARGE),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ticket Cancellation Policy",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_3),
            _IconAndTextView(
              imagePath: "ic_drink_food.png",
              text: "100% Refund on F&B",
            ),
            const SizedBox(height: MARGIN_MEDIUM_2),
            _IconAndTextView(
              imagePath: "ic_ticket.png",
              text: "Up to 75% Refund for Tickets",
            ),
            const SizedBox(height: MARGIN_MEDIUM_2),
            _IconAndTextView(
              text: "-75% refund until 2 hours before show start time",
            ),
            const SizedBox(height: MARGIN_MEDIUM_2),
            _IconAndTextView(
              text:
                  "-50% refund between 2 hours and 20 minutes before show start time",
            ),
            const SizedBox(height: MARGIN_XXLARGE),
            _DescriptionTextView(
              text:
                  "1. Refund not available for Convenience fees,Vouchers, Gift Cards, Taxes etc.",
              textColor: Colors.white,
            ),
            const SizedBox(height: MARGIN_LARGE),
            _DescriptionTextView(
              text: "2. No cancellation within 20minute of show start time.",
              textColor: Colors.white,
            ),
            const SizedBox(height: MARGIN_XLARGE),
            CommonButtonView(
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {
                context.popBack();
              },
            )
          ],
        ),
      ),
    );
  }
}

class _DescriptionTextView extends StatelessWidget {
  final Color textColor;
  final String text;

  _DescriptionTextView({required this.textColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconAndTextView extends StatelessWidget {
  final String? imagePath;
  final String text;

  _IconAndTextView({this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        imagePath == null
            ? const SizedBox(
                width: MARGIN_XLARGE,
                height: MARGIN_XLARGE,
              )
            : Image.asset(
                imagePath!.toAssetIcon(),
                color: Colors.white,
                height: MARGIN_XLARGE,
                width: MARGIN_XLARGE,
              ),
        const SizedBox(width: MARGIN_MEDIUM),
        _DescriptionTextView(
          textColor: imagePath == null ? TEXT_GREY_COLOR : Colors.white,
          text: text,
        ),
      ],
    );
  }
}
