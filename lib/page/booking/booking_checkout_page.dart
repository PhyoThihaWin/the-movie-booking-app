import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/page/payment/payment_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/appbar_back_icon_view.dart';
import 'package:moviebooking/widget/booking_button_view.dart';

import '../../data/vos/checkout_request_vo.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/invoice_whole_view.dart';

class BookingCheckoutPage extends StatefulWidget {
  final CheckoutRequestVo checkoutRequest;

  BookingCheckoutPage(this.checkoutRequest);

  @override
  State<BookingCheckoutPage> createState() => _BookingCheckoutPageState();
}

class _BookingCheckoutPageState extends State<BookingCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: true,
        elevation: 0,
        title: AppBarTitleView(
          "Checkout",
          fontSize: TEXT_REGULAR_3X,
        ),
        leading: AppBarBackIconView(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InvoiceWholeView(
                checkoutRequest: widget.checkoutRequest,
                onRemoved: (snack) {
                  setState(() {
                    widget.checkoutRequest.snackCartList
                        ?.removeWhere((element) => element.id == snack.id);
                  });
                }),
            const SizedBox(height: MARGIN_MEDIUM_3),
            BookingButtonView(
              btnText: "Continue",
              btnClick: () {
                widget.checkoutRequest.snacks = widget
                    .checkoutRequest.snackCartList
                    ?.map((e) => Snacks(id: e.id, quantity: e.qty))
                    .toList();
                context.next(PaymentPage(widget.checkoutRequest));
              },
            ),
            const SizedBox(height: MARGIN_XLARGE),
          ],
        ),
      ),
    );
  }
}
