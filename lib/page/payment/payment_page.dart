import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/checkout_request_vo.dart';
import 'package:moviebooking/page/payment/ticket_confirmation_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/common_button_view.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../data/vos/payment_type_vo.dart';
import '../../resource/dimens.dart';
import '../../viewitem/payment_list_item_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_title_view.dart';

class PaymentPage extends StatefulWidget {
  final CheckoutRequestVo checkoutRequest;

  PaymentPage(this.checkoutRequest);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  List<PaymentTypeVo>? paymentTypes;

  @override
  void initState() {
    movieBookingModel.getPaymentTypes().then((value) {
      setState(() {
        paymentTypes = value;
      });
    }).catchError((error) => debugPrint(error.toString()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: true,
        elevation: 0,
        title: AppBarTitleView(
          "Payment",
          fontSize: TEXT_REGULAR_3X,
        ),
        leading: AppBarBackIconView(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_XLARGE,
                vertical: MARGIN_MEDIUM_2,
              ),
              child: Column(
                children: [
                  const _NameInputFieldView(),
                  const SizedBox(height: MARGIN_XLARGE),
                  CommonButtonView(
                      child: const _UnlockBtnRowView(), onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: MARGIN_LARGE),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                child: paymentTypes == null
                    ? const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : ListView.builder(
                        itemCount: paymentTypes?.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            vertical: MARGIN_MEDIUM_3),
                        itemBuilder: (context, index) => PaymentListItemView(
                            paymentType: paymentTypes![index],
                            onPaymentSelected: () {
                              /// final call checkout endpoint !!
                              widget.checkoutRequest.paymentTypeId =
                                  paymentTypes![index].id;
                              _checkoutBookingTicket(widget.checkoutRequest);
                            }),
                      )),
            const SizedBox(height: MARGIN_MEDIUM_2),
          ],
        ),
      ),
    );
  }

  _checkoutBookingTicket(CheckoutRequestVo checkoutRequestVo) {
    context.showLoaderDialog();
    movieBookingModel.checkoutBookingTicket(checkoutRequestVo).then((value) {
      Navigator.pop(context);
      context.next(TicketConfirmationPage(value));
    }).catchError((error) => error.toString());
  }
}

class _PaymentListTitleView extends StatelessWidget {
  const _PaymentListTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Choose your payment type",
      style: TextStyle(
        color: PRIMARY_COLOR,
        fontSize: TEXT_REGULAR_3X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UnlockBtnRowView extends StatelessWidget {
  const _UnlockBtnRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "ic_discount.png".toAssetIcon(),
          width: MARGIN_LARGE,
        ),
        const SizedBox(width: MARGIN_MEDIUM),
        const Text(
          "Unlock Offer or Apply Promocode",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class _NameInputFieldView extends StatelessWidget {
  const _NameInputFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(child: _NameTextFieldView()),
        SizedBox(width: MARGIN_MEDIUM),
        Padding(
          padding: const EdgeInsets.only(top: MARGIN_MEDIUM),
          child: Text(
            "*",
            style: TextStyle(
                color: Colors.red,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

class _NameTextFieldView extends StatelessWidget {
  const _NameTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: MARGIN_6),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2 + MARGIN_6,
                  vertical: MARGIN_MEDIUM_3),
              hintText: "Enter your name",
              hintStyle: const TextStyle(
                color: TEXT_GREY_COLOR,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: MARGIN_MEDIUM_2,
          child: Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_6),
            child: const Text(
              "Your Name",
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
