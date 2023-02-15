import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/buy_snack_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../widget/booking_available_info_view.dart';
import '../../widget/booking_button_view.dart';
import '../../widget/ripple_effect.dart';

class BookingChairPage extends StatelessWidget {
  BookingChairPage({Key? key}) : super(key: key);

  final List<int> chairList = [0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        elevation: 0,
        leading: RippleTap(
          onTap: () {
            context.popBack();
          },
          isCircle: true,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("cinema_screen.png".toAssetImage()),
                  ChairListViewSection(chairList),
                  BookingAvailableInfoRowSection(),
                  ZoomSeekBarView(),
                  SizedBox(height: MARGIN_LARGE),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_XLARGE,
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
          children: [
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
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_4X,
              ),
            )
          ],
        ),
        Spacer(),
        BookingButtonView(
          btnText: "Buy Ticket",
          btnClick: () {
            context.next(BuySnackPage());
          },
        )
      ],
    );
  }
}

class ZoomSeekBarView extends StatefulWidget {
  @override
  State<ZoomSeekBarView> createState() => _ZoomSeekBarViewState();
}

class _ZoomSeekBarViewState extends State<ZoomSeekBarView> {
  int valueHolder = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MARGIN_MEDIUM_3),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: TEXT_GREY_COLOR,
          ),
          Expanded(
            child: Slider(
              min: 1,
              max: 10,
              value: valueHolder.toDouble(),
              activeColor: PRIMARY_COLOR,
              inactiveColor: TEXT_GREY_COLOR,
              label: '${valueHolder.round()}',
              onChanged: (double newValue) {
                setState(() {
                  valueHolder = newValue.round();
                });
              },
              semanticFormatterCallback: (double newValue) {
                return '${newValue.round()}';
              },
            ),
          ),
          Icon(
            Icons.remove,
            color: TEXT_GREY_COLOR,
          ),
        ],
      ),
    );
  }
}

class BookingAvailableInfoRowSection extends StatelessWidget {
  const BookingAvailableInfoRowSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SEARCH_BOX_COLOR,
      padding: EdgeInsets.symmetric(vertical: MARGIN_6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BookingAvailabilityInfoView("Available", Colors.white),
          BookingAvailabilityInfoView("Taken", TEXT_GREY_COLOR),
          BookingAvailabilityInfoView("Your Selection", PRIMARY_COLOR),
        ],
      ),
    );
  }
}

class ChairListViewSection extends StatelessWidget {
  ChairListViewSection(this.chairList);

  final List<int> chairList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chairList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => (chairList[index] == 0)
          ? ChairPriceTextView()
          : (chairList[index] == 1)
              ? Row(
                  children: [
                    SizedBox(width: MARGIN_MEDIUM),
                    RowTitleTextView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    Spacer(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    RowTitleTextView(),
                    SizedBox(width: MARGIN_MEDIUM),
                  ],
                )
              : Row(
                  children: [
                    SizedBox(width: MARGIN_MEDIUM),
                    RowTitleTextView(),
                    ChairCoupleImageView(),
                    Spacer(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    ChairSingleImageView(),
                    Spacer(),
                    ChairCoupleImageView(),
                    RowTitleTextView(),
                    SizedBox(width: MARGIN_MEDIUM),
                  ],
                ),
    );
  }
}

class ChairPriceTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_10),
      child: Text(
        "Normal (4500Ks)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: TEXT_GREY_COLOR,
          fontSize: TEXT_REGULAR_2X,
        ),
      ),
    );
  }
}

class RowTitleTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "A",
      style: TextStyle(
        color: TEXT_GREY_COLOR,
        fontSize: TEXT_SMALL,
      ),
    );
  }
}

class ChairCoupleImageView extends StatefulWidget {
  @override
  State<ChairCoupleImageView> createState() => _ChairCoupleImageViewState();
}

class _ChairCoupleImageViewState extends State<ChairCoupleImageView> {
  bool? _isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          (_isSelected ?? false) ? _isSelected = false : _isSelected = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM),
        child: Image.asset(
          "ic_chair_couple.png".toAssetIcon(),
          width: MARGIN_XXLARGE,
          color: _isSelected == null
              ? SEARCH_BOX_COLOR
              : _isSelected!
                  ? PRIMARY_COLOR
                  : Colors.white,
        ),
      ),
    );
  }
}

class ChairSingleImageView extends StatefulWidget {
  @override
  State<ChairSingleImageView> createState() => _ChairSingleImageViewState();
}

class _ChairSingleImageViewState extends State<ChairSingleImageView> {
  bool? _isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          (_isSelected ?? false) ? _isSelected = false : _isSelected = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_6),
        child: Image.asset(
          "ic_chair_single.png".toAssetIcon(),
          width: MARGIN_XLARGE,
          color: _isSelected == null
              ? SEARCH_BOX_COLOR
              : _isSelected!
                  ? PRIMARY_COLOR
                  : Colors.white,
        ),
      ),
    );
  }
}
