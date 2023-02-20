import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/booking_checkout_page.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/common_button_view.dart';
import 'package:moviebooking/widget/ticket_count_richtext_view.dart';

import '../../resource/dimens.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/checkout_movie_cinema_info_view.dart';
import '../../widget/invoice_background_view.dart';
import '../../widget/invoice_circle_slip_view.dart';

class TicketConfirmationPage extends StatefulWidget {
  const TicketConfirmationPage({Key? key}) : super(key: key);

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFullOverLayDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: AppBarTitleView(
          "Ticket Confirmation",
          fontSize: TEXT_REGULAR_3X,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_2),
            child: TicketItemView(),
          ),
          const _TicketQRCodeSection(),
          SizedBox(
            width: context.getScreenWidthBy(2),
            child: _DoneButtonView(),
          ),
          Container(),
        ],
      ),
    );
  }

  _showFullOverLayDialog() {
    showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          context.popBack();
        },
        child: Container(
          color: Colors.black.withOpacity(0.85),
          padding: EdgeInsets.only(bottom: context.getScreenHeightBy(6)),
          child: Image.asset(
            "ticket_confirm.png".toAssetImage(),
            scale: 1.4,
          ),
        ),
      ),
    );
  }
}

class _DoneButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonButtonView(
        child: const Text(
          "DONE",
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          context.nextRemove(const HomePage());
        });
  }
}

class _TicketQRCodeSection extends StatelessWidget {
  const _TicketQRCodeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.qr_code_2,
          size: MARGIN_XXLARGE * 2.5,
          color: Colors.white,
        ),
        const Text(
          "WAG5LP1C",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_4X,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "TPIN : ",
              style: TextStyle(
                color: TEXT_GREY_COLOR,
                fontSize: TEXT_REGULAR_4X,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "WKCSL96",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_4X,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TicketItemView extends StatelessWidget {
  const TicketItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        SizedBox(
          height: context.getScreenHeightBy(7.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const _TicketMovieTitleView(),
              const _TicketMoiveNameView(),
              TicketCountRichTextView(fontSize: TEXT_REGULAR),
              const _TicketChairNumberView(),
            ],
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
