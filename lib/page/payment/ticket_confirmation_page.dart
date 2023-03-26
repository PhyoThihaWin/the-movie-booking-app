import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/checkout_result_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/common_button_view.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../resource/dimens.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/ticket_item_view.dart';

class TicketConfirmationPage extends StatefulWidget {
  final CheckoutResultVo? checkoutResultVo;

  TicketConfirmationPage(this.checkoutResultVo);

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  MovieVo? movieVo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFullOverLayDialog();
    });

    movieBookingModel
        .getSingleMovie(widget.checkoutResultVo?.movieId ?? 0)
        .then((value) {
      setState(() {
        movieVo = value;
      });
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
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_2),
            child: TicketItemView(
              checkoutResultVo: widget.checkoutResultVo,
              movieVo: movieVo,
            ),
          ),
          _TicketQRCodeSection(
              "$BASE_URL_DIO/${widget.checkoutResultVo?.qrCode ?? ""}"),
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
  final String ticketQr;

  _TicketQRCodeSection(this.ticketQr);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          ticketQr,
          fit: BoxFit.cover,
          width: MARGIN_LARGE * 4,
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        const Text(
          "WAG5LP1C",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
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
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "WKCSL96",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
