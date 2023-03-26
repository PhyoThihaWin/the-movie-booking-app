import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/data/vos/snack_vo.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';
import 'package:moviebooking/widget/ticket_count_richtext_view.dart';

import '../data/vos/checkout_request_vo.dart';
import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'checkout_movie_cinema_info_view.dart';
import 'dialog/ticket_cancellation_dialog.dart';
import 'invoice_background_view.dart';
import 'invoice_circle_slip_view.dart';

class InvoiceWholeView extends StatelessWidget {
  final CheckoutRequestVo? checkoutRequest;
  final Function(SnackVo)? onRemoved;

  InvoiceWholeView({this.checkoutRequest, this.onRemoved});

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
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_3,
                    right: MARGIN_MEDIUM_3,
                    top: MARGIN_MEDIUM_3,
                    bottom: MARGIN_MEDIUM_2),
                child: _InvoiceUpperViewSection(
                  checkoutRequest: checkoutRequest,
                  onRemoved: onRemoved,
                ),
              ),
              const InvoiceCircleSlipView(),
              Padding(
                padding: const EdgeInsets.all(
                  MARGIN_MEDIUM_3,
                ),
                child: _InvoiceLowerViewSection(checkoutRequest),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _InvoiceLowerViewSection extends StatelessWidget {
  final CheckoutRequestVo? checkoutRequestVo;

  _InvoiceLowerViewSection(this.checkoutRequestVo);

  @override
  Widget build(BuildContext context) {
    int grandTotal = (checkoutRequestVo?.ticketPrice).orZero;
    if (checkoutRequestVo?.snackCartList?.isNotEmpty ?? false) {
      grandTotal += (checkoutRequestVo?.snackCartList
          ?.map((e) => e.qty * e.price.orZero)
          .reduce((value, element) => value + element)).orZero;
    }
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
        _InvoiceTotalRowView(grandTotal),
        const SizedBox(height: MARGIN_SMALL),
      ],
    );
  }
}

class _InvoiceUpperViewSection extends StatelessWidget {
  final CheckoutRequestVo? checkoutRequest;
  final Function(SnackVo)? onRemoved;

  _InvoiceUpperViewSection({required this.checkoutRequest, this.onRemoved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CheckoutMovieTitleView((checkoutRequest?.movieName).orEmpty),
        const SizedBox(height: MARGIN_MEDIUM),
        _CheckoutCinemaTextView(checkoutRequest?.cinemaTimeSlot),
        const SizedBox(height: MARGIN_LARGE),
        CheckoutMovieCinemaInfoView(
            bookingDate: checkoutRequest?.bookingDate ?? "",
            startTime: checkoutRequest?.getTimeSlotTime() ?? ""),
        const SizedBox(height: MARGIN_LARGE),
        TicketCountRichTextView(count: (checkoutRequest?.ticketCount).orZero),
        const SizedBox(height: MARGIN_10),
        _TicketNumberAndPriceRowView(checkoutRequest),
        const SizedBox(height: MARGIN_MEDIUM_2),
        const Divider(color: Colors.white),
        const SizedBox(height: MARGIN_MEDIUM_2),
        _CheckoutSnackColumnListView(
          snackCartList: (checkoutRequest?.snackCartList).orEmptyObject,
          onRemoved: onRemoved,
        ),
      ],
    );
  }
}

class _InvoiceTotalRowView extends StatelessWidget {
  final int totalPrice;

  _InvoiceTotalRowView(this.totalPrice);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Total",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "${totalPrice.toMMK + 500}Ks",
          style: const TextStyle(
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
  final List<SnackVo> snackCartList;
  final Function(SnackVo)? onRemoved;

  _CheckoutSnackColumnListView({required this.snackCartList, this.onRemoved});

  @override
  State<_CheckoutSnackColumnListView> createState() =>
      _CheckoutSnackColumnViewState();
}

class _CheckoutSnackColumnViewState
    extends State<_CheckoutSnackColumnListView> {
  bool _isExpand = true;
  int snackTotalPrice = 0;

  @override
  void initState() {
    if (widget.snackCartList.isNotEmpty) {
      snackTotalPrice = (widget.snackCartList
          .map((e) => e.qty * e.price.orZero)
          .reduce((value, element) => value + element)).orZero;
    } else snackTotalPrice = 0;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _CheckoutSnackColumnListView oldWidget) {
    if (widget.snackCartList.isNotEmpty) {
      snackTotalPrice = (widget.snackCartList
          .map((e) => e.qty * e.price.orZero)
          .reduce((value, element) => value + element)).orZero;
    } else snackTotalPrice = 0;
    super.didUpdateWidget(oldWidget);
  }

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
          child: _snackCheckoutTitleRowView(
              isExpand: _isExpand, snackTotalPrice: snackTotalPrice),
        ),
        Visibility(
          visible: _isExpand,
          child: ListView.builder(
            itemCount: widget.snackCartList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: MARGIN_CARD_MEDIUM_2),
              child: _snackCheckoutItemView(
                snackVo: widget.snackCartList[index],
                onRemoved: widget.onRemoved,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _snackCheckoutItemView extends StatelessWidget {
  final SnackVo snackVo;
  final Function(SnackVo)? onRemoved;

  _snackCheckoutItemView({required this.snackVo, this.onRemoved});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onRemoved?.call(snackVo);
          },
          child: Image.asset(
            "ic_remove_snack.png".toAssetIcon(),
            scale: 3,
          ),
        ),
        const SizedBox(width: MARGIN_MEDIUM),
        Text(
          "${snackVo.name.orEmpty} (Qt.${snackVo.qty})",
          style: const TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          "${snackVo.price.toMMK} Ks",
          style: const TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _snackCheckoutTitleRowView extends StatelessWidget {
  const _snackCheckoutTitleRowView({
    super.key,
    required bool isExpand,
    required this.snackTotalPrice,
  }) : _isExpand = isExpand;

  final bool _isExpand;
  final int snackTotalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            _isExpand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Text(
          "${snackTotalPrice.toMMK} Ks",
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TicketNumberAndPriceRowView extends StatelessWidget {
  final CheckoutRequestVo? checkoutRequestVo;

  _TicketNumberAndPriceRowView(this.checkoutRequestVo);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          (checkoutRequestVo?.seatNumber).orEmpty,
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "${(checkoutRequestVo?.ticketPrice).orZero.toMMK} Ks",
          style: const TextStyle(
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
  final CinemaShowTimeVo? cinemaShowTime;

  _CheckoutCinemaTextView(this.cinemaShowTime);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          (cinemaShowTime?.cinema).orEmpty,
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        const SizedBox(width: MARGIN_MEDIUM),
        const Text(
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
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: MARGIN_MEDIUM),
        const Text(
          "(3D)(U/A)",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
          ),
        )
      ],
    );
  }

  _CheckoutMovieTitleView(this.title);
}
