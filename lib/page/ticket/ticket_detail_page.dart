import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/widget/invoice_whole_view.dart';

import '../../resource/dimens.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/booking_button_view.dart';

class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: true,
        elevation: 0,
        title: AppBarTitleView(
          "Ticket Detail",
          fontSize: TEXT_REGULAR_3X,
        ),
        leading: AppBarBackIconView(),
      ),
      body: Column(
        children: const [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: MARGIN_LARGE),
              child: InvoiceWholeView(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MARGIN_MEDIUM_3,
              left: MARGIN_MEDIUM_3,
              right: MARGIN_MEDIUM_3,
              bottom: MARGIN_XLARGE,
            ),
            child: BuyTicketViewSection(),
          )
        ],
      ),
    );
  }
}

class BuyTicketViewSection extends StatelessWidget {
  const BuyTicketViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "2 Tickets",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_3X,
              ),
            ),
            Text(
              "17,000KS",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_4X,
              ),
            )
          ],
        ),
        const Spacer(),
        BookingButtonView(
          btnText: "Cancel Booking",
          btnTextColor: Colors.white,
          btnColor: Colors.deepOrange,
          btnClick: () {
            // context.next(BuySnackPage());
          },
        )
      ],
    );
  }
}
