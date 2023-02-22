import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';
import 'package:moviebooking/widget/ticket_count_richtext_view.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'checkout_movie_cinema_info_view.dart';
import 'dialog/ticket_cancellation_dialog.dart';
import 'invoice_background_view.dart';
import 'invoice_circle_slip_view.dart';

class InvoiceWholeView extends StatelessWidget {
  const InvoiceWholeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
        vertical: MARGIN_MEDIUM_2,
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: InvoiceBackgroundImageView(),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                    left: MARGIN_MEDIUM_3,
                    right: MARGIN_MEDIUM_3,
                    top: MARGIN_MEDIUM_3,
                    bottom: MARGIN_MEDIUM_2),
                child: _InvoiceUpperViewSection(),
              ),
              InvoiceCircleSlipView(),
              Padding(
                padding: EdgeInsets.all(
                  MARGIN_MEDIUM_3,
                ),
                child: _InvoiceLowerViewSection(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _InvoiceLowerViewSection extends StatelessWidget {
  const _InvoiceLowerViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ConvenienceFeeView(),
        const SizedBox(height: MARGIN_MEDIUM_3),
        RippleTap(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const TicketCancellationDialog(),
              );
            },
            child: const _TicketCancelPolicyView()),
        const SizedBox(height: MARGIN_LARGE),
        const Divider(color: Colors.white),
        const SizedBox(height: MARGIN_MEDIUM_3),
        const _InvoiceTotalRowView(),
        const SizedBox(height: MARGIN_SMALL),
      ],
    );
  }
}

class _InvoiceUpperViewSection extends StatelessWidget {
  const _InvoiceUpperViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CheckoutMovieTitleView(),
        const SizedBox(height: MARGIN_MEDIUM),
        const _CheckoutCinemaTextView(),
        const SizedBox(height: MARGIN_LARGE),
        CheckoutMovieCinemaInfoView(),
        const SizedBox(height: MARGIN_LARGE),
        TicketCountRichTextView(),
        const SizedBox(height: MARGIN_10),
        const _TicketNumberAndPriceRowView(),
        const SizedBox(height: MARGIN_MEDIUM_2),
        const Divider(color: Colors.white),
        const SizedBox(height: MARGIN_MEDIUM_2),
        _CheckoutSnackColumnListView(),
      ],
    );
  }
}

class _InvoiceTotalRowView extends StatelessWidget {
  const _InvoiceTotalRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Total",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          "22,500Ks",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TicketCancelPolicyView extends StatelessWidget {
  const _TicketCancelPolicyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
        color: Colors.deepOrange,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          SizedBox(width: MARGIN_SMALL),
          Text(
            "Ticket Cancellation Policy",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class _ConvenienceFeeView extends StatelessWidget {
  const _ConvenienceFeeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "Convenience Fee",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        Spacer(),
        Text(
          "500Ks",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _CheckoutSnackColumnListView extends StatefulWidget {
  @override
  State<_CheckoutSnackColumnListView> createState() =>
      _CheckoutSnackColumnViewState();
}

class _CheckoutSnackColumnViewState
    extends State<_CheckoutSnackColumnListView> {
  bool _isExpand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpand = !_isExpand;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "ic_drink_food.png".toAssetIcon(),
                color: Colors.white,
                scale: 2.2,
              ),
              const SizedBox(width: MARGIN_SMALL),
              const Text(
                "Food And Beverage",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: MARGIN_SMALL,
                  left: MARGIN_SMALL,
                ),
                child: Icon(
                  _isExpand
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Text(
                "2,000Ks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isExpand,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: MARGIN_CARD_MEDIUM_2),
              child: Row(
                children: [
                  Image.asset(
                    "ic_remove_snack.png".toAssetIcon(),
                    scale: 3,
                  ),
                  const SizedBox(width: MARGIN_MEDIUM),
                  const Text(
                    "Potato Chips (Qt. 1)",
                    style: TextStyle(
                      color: TEXT_GREY_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "1,000Ks",
                    style: TextStyle(
                      color: TEXT_GREY_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _TicketNumberAndPriceRowView extends StatelessWidget {
  const _TicketNumberAndPriceRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Gold-G4,G5",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          "20,000Ks",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _CheckoutCinemaTextView extends StatelessWidget {
  const _CheckoutCinemaTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "JCGV : Junction City",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "(SCREEN 2)",
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ],
    );
  }
}

class _CheckoutMovieTitleView extends StatelessWidget {
  const _CheckoutMovieTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Black Window",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "(3D)(U/A)",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
          ),
        )
      ],
    );
  }
}
