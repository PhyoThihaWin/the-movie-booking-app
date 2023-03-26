import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/checkout_result_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/page/ticket/ticket_detail_page.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../network/api_constants.dart';
import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'checkout_movie_cinema_info_view.dart';
import 'invoice_background_view.dart';
import 'invoice_circle_slip_view.dart';
import 'ticket_count_richtext_view.dart';

class TicketItemView extends StatelessWidget {
  final CheckoutResultVo? checkoutResultVo;
  final MovieVo? movieVo;

  TicketItemView({this.checkoutResultVo, this.movieVo});

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        context.next(TicketDetailPage());
      },
      child: Stack(
        children: [
          const Positioned.fill(
            child: InvoiceBackgroundImageView(),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(MARGIN_MEDIUM_3),
                child: _TicketUpperRowSection(
                  checkoutResultVo: checkoutResultVo,
                  movieVo: movieVo,
                ),
              ),
              const InvoiceCircleSlipView(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: MARGIN_MEDIUM,
                ),
                child: CheckoutMovieCinemaInfoView(
                  bookingDate: checkoutResultVo?.bookingDate ?? "",
                  startTime: checkoutResultVo?.timeslot?.startTime ?? "",
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_3)
            ],
          )
        ],
      ),
    );
  }
}

class _TicketUpperRowSection extends StatelessWidget {
  final CheckoutResultVo? checkoutResultVo;
  final MovieVo? movieVo;

  _TicketUpperRowSection(
      {required this.checkoutResultVo, required this.movieVo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          child: movieVo == null
              ? SizedBox(
                  width: context.getScreenWidthBy(4),
                  height: context.getScreenHeightBy(7.5),
                  child: Center(child: CircularProgressIndicator()))
              : Image.network(
                  "$IMAGE_BASE_URL${(movieVo?.posterPath).orEmpty}",
                  fit: BoxFit.cover,
                  width: context.getScreenWidthBy(4),
                  height: context.getScreenHeightBy(7.5),
                ),
        ),
        const SizedBox(width: MARGIN_MEDIUM_2),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              minHeight: context.getScreenHeightBy(7.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _TicketMovieTitleView(movieVo?.originalTitle ?? ""),
                _TicketCinemaNameView(checkoutResultVo?.bookingNo ?? ""),
                TicketCountRichTextView(
                    fontSize: TEXT_REGULAR,
                    count: checkoutResultVo?.totalSeat ?? 0),
                _TicketChairNumberView(checkoutResultVo?.seat ?? ""),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TicketMovieTitleView extends StatelessWidget {
  final String title;

  _TicketMovieTitleView(this.title);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: Colors.white,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(
              text: ' (3D)(U/A)',
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }
}

class _TicketCinemaNameView extends StatelessWidget {
  final String name;

  _TicketCinemaNameView(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: PRIMARY_COLOR,
        fontSize: TEXT_REGULAR_2X,
      ),
    );
  }
}

class _TicketChairNumberView extends StatelessWidget {
  final String seatNumber;

  _TicketChairNumberView(this.seatNumber);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          seatNumber,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "(SCREEN 2)",
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR,
          ),
        ),
      ],
    );
  }
}
