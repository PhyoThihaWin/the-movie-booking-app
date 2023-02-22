import 'package:flutter/material.dart';
import 'package:moviebooking/page/ticket/ticket_detail_page.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'checkout_movie_cinema_info_view.dart';
import 'invoice_background_view.dart';
import 'invoice_circle_slip_view.dart';
import 'ticket_count_richtext_view.dart';

class TicketItemView extends StatelessWidget {
  const TicketItemView({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.all(MARGIN_MEDIUM_3),
                child: _TicketUpperRowSection(),
              ),
              const InvoiceCircleSlipView(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: MARGIN_MEDIUM,
                ),
                child: CheckoutMovieCinemaInfoView(),
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
  const _TicketUpperRowSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          child: Image.network(
            "https://pbs.twimg.com/media/D7Mw2d2XsAAXiYH.jpg",
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
                const _TicketMovieTitleView(),
                const _TicketMoiveNameView(),
                TicketCountRichTextView(fontSize: TEXT_REGULAR),
                const _TicketChairNumberView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TicketMovieTitleView extends StatelessWidget {
  const _TicketMovieTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Black Window, 20 Century ',
        style: TextStyle(
          color: Colors.white,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '(3D)(U/A)',
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

class _TicketMoiveNameView extends StatelessWidget {
  const _TicketMoiveNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "JCGV : Junction City",
      style: TextStyle(
        color: PRIMARY_COLOR,
        fontSize: TEXT_REGULAR_2X,
      ),
    );
  }
}

class _TicketChairNumberView extends StatelessWidget {
  const _TicketChairNumberView({
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
