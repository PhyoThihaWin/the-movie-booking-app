import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/buy_snack_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/appbar_back_icon_view.dart';

class BookingCheckoutPage extends StatelessWidget {
  const BookingCheckoutPage({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_MEDIUM_2,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                    child: Image.asset(
                      "bg_checkout_invoice.png".toAssetImage(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MARGIN_MEDIUM_3,
                          right: MARGIN_MEDIUM_3,
                          top: MARGIN_MEDIUM_3,
                          bottom: MARGIN_MEDIUM_2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutMovieTitleView(),
                          SizedBox(height: MARGIN_MEDIUM),
                          CheckoutCinemaTextView(),
                          SizedBox(height: MARGIN_LARGE),
                          MovieCinemaInfoSection(),
                          SizedBox(height: MARGIN_LARGE),
                          TicketCountRichTextView(),
                          SizedBox(height: MARGIN_10),
                          TicketNumberAndPriceRowView(),
                          SizedBox(height: MARGIN_MEDIUM_2),
                          Divider(color: Colors.white),
                          SizedBox(height: MARGIN_MEDIUM_2),
                          CheckoutSnackColumnListView(),
                        ],
                      ),
                    ),
                    InvoiceCircleSlipView(),
                    Padding(
                      padding: EdgeInsets.all(
                        MARGIN_MEDIUM_3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConvenienceFeeView(),
                          const SizedBox(height: MARGIN_MEDIUM_3),
                          TicketCancelPolicyView(),
                          SizedBox(height: MARGIN_LARGE),
                          Divider(color: Colors.white),
                          SizedBox(height: MARGIN_MEDIUM_3),
                          Row(
                            children: [
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
                          ),
                          SizedBox(height: MARGIN_SMALL),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TicketCancelPolicyView extends StatelessWidget {
  const TicketCancelPolicyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
        color: Colors.deepOrange,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_SMALL,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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

class ConvenienceFeeView extends StatelessWidget {
  const ConvenienceFeeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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

class InvoiceCircleSlipView extends StatelessWidget {
  const InvoiceCircleSlipView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomHalfCircleView(
          isLeft: true,
          size: MARGIN_XXLARGE,
        ),
        SizedBox(width: MARGIN_SMALL),
        Expanded(
            child: DottedLine(
          dashLength: MARGIN_10,
          dashColor: TEXT_GREY_COLOR.withOpacity(0.4),
          dashGapLength: MARGIN_SMALL,
        )),
        SizedBox(width: MARGIN_SMALL),
        CustomHalfCircleView(
          isLeft: false,
          size: MARGIN_XXLARGE,
        ),
      ],
    );
  }
}

class CustomHalfCircleView extends StatelessWidget {
  final bool isLeft;
  final double size;

  CustomHalfCircleView({required this.isLeft, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: size / 2,
        decoration: BoxDecoration(
          color: HOME_SCREEN_BACKGROUND_COLOR,
          borderRadius: isLeft
              ? BorderRadius.only(
                  topRight: Radius.circular(size),
                  bottomRight: Radius.circular(size),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(size),
                  bottomLeft: Radius.circular(size),
                ),
        ));
  }
}

class CheckoutSnackColumnListView extends StatefulWidget {
  @override
  State<CheckoutSnackColumnListView> createState() =>
      _CheckoutSnackColumnViewState();
}

class _CheckoutSnackColumnViewState extends State<CheckoutSnackColumnListView> {
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
              SizedBox(width: MARGIN_SMALL),
              Text(
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
              Spacer(),
              Text(
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
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: MARGIN_MEDIUM_3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: MARGIN_CARD_MEDIUM_2),
              child: Row(
                children: [
                  Image.asset(
                    "ic_remove_snack.png".toAssetIcon(),
                    scale: 3,
                  ),
                  SizedBox(width: MARGIN_MEDIUM),
                  Text(
                    "Potato Chips (Qt. 1)",
                    style: TextStyle(
                      color: TEXT_GREY_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
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

class TicketNumberAndPriceRowView extends StatelessWidget {
  const TicketNumberAndPriceRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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

class TicketCountRichTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'M-Ticket(',
        style: TextStyle(
          color: TEXT_GREY_COLOR,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w700,
        ),
        children: const <TextSpan>[
          TextSpan(
              text: '2',
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(text: ')'),
        ],
      ),
    );
  }
}

class MovieCinemaInfoSection extends StatelessWidget {
  const MovieCinemaInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MovieCinemaInfoView(
            "ic_calendar.png",
            "Sat, 18 Jun, 2022",
          ),
        ),
        Expanded(
            child: MovieCinemaInfoView(
          "ic_time.png",
          "3:30PM",
        )),
        Expanded(
            child: MovieCinemaInfoView(
          "ic_location.png",
          "Baho St, BuTarYone Lann Bus stop, Hlaing",
        )),
      ],
    );
  }
}

class MovieCinemaInfoView extends StatelessWidget {
  final String iconPath;
  final String itemString;

  MovieCinemaInfoView(this.iconPath, this.itemString);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconPath.toAssetIcon(),
          height: MARGIN_MEDIUM_3,
          width: MARGIN_MEDIUM_3,
        ),
        const SizedBox(height: MARGIN_10),
        Text(
          itemString,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}

class CheckoutCinemaTextView extends StatelessWidget {
  const CheckoutCinemaTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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

class CheckoutMovieTitleView extends StatelessWidget {
  const CheckoutMovieTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
