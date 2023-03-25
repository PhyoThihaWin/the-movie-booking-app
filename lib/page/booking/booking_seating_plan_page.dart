import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/seating_plan_vo.dart';
import 'package:moviebooking/page/booking/buy_snack_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/app_constants.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../widget/booking_available_info_view.dart';
import '../../widget/booking_button_view.dart';
import '../../widget/ripple_effect.dart';

class BookingSeatingPlanPage extends StatefulWidget {
  final int timeSlotId;
  final String bookingDate;

  BookingSeatingPlanPage(this.timeSlotId, this.bookingDate);

  @override
  State<BookingSeatingPlanPage> createState() => _BookingSeatingPlanPageState();
}

class _BookingSeatingPlanPageState extends State<BookingSeatingPlanPage> {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  List<SeatingPlanVo>? seatPlanList;

  @override
  void initState() {
    movieBookingModel
        .getSeatingPlanByShowTime(widget.timeSlotId, widget.bookingDate)
        .then((value) {
      setState(() {
        seatPlanList = value;
        debugPrint("List length ==> ${seatPlanList?.length}");
      });
    });
    // .catchError((error) => debugPrint("List ==> ${error.toString()}"));

    super.initState();
  }

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
          child: const Icon(
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
                  ChairPriceTextView("Normal Price"),
                  const SizedBox(height: MARGIN_MEDIUM),
                  seatPlanList == null
                      ? const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()))
                      : SeatPlanGridViewSection(
                          seatPlanList: seatPlanList!,
                          seatSelected: (index, seatPlanVo) {
                            setState(() {
                              seatPlanList?.removeAt(index);
                              seatPlanList?.insert(index, seatPlanVo);
                            });
                          }),
                  const SizedBox(height: MARGIN_LARGE),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const BookingAvailableInfoRowSection(),
              ZoomSeekBarView(),
              Padding(
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3,
                  right: MARGIN_MEDIUM_3,
                  bottom: MARGIN_XLARGE,
                ),
                child: seatPlanList == null
                    ? Container()
                    : BuyTicketViewSection(seatPlanList!),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BuyTicketViewSection extends StatelessWidget {
  final List<SeatingPlanVo> seatPlanList;

  BuyTicketViewSection(this.seatPlanList);

  @override
  Widget build(BuildContext context) {
    int ticketCount =
        seatPlanList.where((element) => element.isSelected ?? false).length;
    int totalPrice = 0;
    for (SeatingPlanVo element in seatPlanList) {
      if (element.isSelected.orFalse) {
        totalPrice += element.price.orZero;
      }
    }

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$ticketCount Tickets",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_3X,
              ),
            ),
            Text(
              "$totalPrice \$",
              style: const TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_4X,
              ),
            )
          ],
        ),
        const Spacer(),
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
      padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
      child: Row(
        children: [
          const Icon(
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
          const Icon(
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
      padding: const EdgeInsets.symmetric(vertical: MARGIN_6),
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

class SeatPlanGridViewSection extends StatelessWidget {
  final List<SeatingPlanVo> seatPlanList;
  final Function(int, SeatingPlanVo) seatSelected;

  SeatPlanGridViewSection(
      {required this.seatPlanList, required this.seatSelected});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 16, childAspectRatio: 1),
      itemCount: seatPlanList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => seatPlanList[index].type ==
              SEAT_TYPE_TEXT
          ? Center(child: RowTitleTextView(seatPlanList[index].symbol.orEmpty))
          : seatPlanList[index].type == SEAT_TYPE_SPACE
              ? const Spacer()
              : ChairSingleImageView(
                  seatingPlan: seatPlanList[index],
                  seatSelected: (seatPlanVo) {
                    seatSelected(index, seatPlanVo);
                  },
                ),
    );
  }
}

class ChairPriceTextView extends StatelessWidget {
  final String text;

  ChairPriceTextView(this.text); //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: TEXT_GREY_COLOR,
          fontSize: TEXT_REGULAR_2X,
        ),
      ),
    );
  }
}

class RowTitleTextView extends StatelessWidget {
  final String text;

  RowTitleTextView(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
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
  final SeatingPlanVo seatingPlan;
  final Function(SeatingPlanVo) seatSelected;

  ChairSingleImageView({
    required this.seatingPlan,
    required this.seatSelected,
  });

  @override
  State<ChairSingleImageView> createState() => _ChairSingleImageViewState();
}

class _ChairSingleImageViewState extends State<ChairSingleImageView> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.seatingPlan.type != SEAT_TYPE_TAKEN) {
            if (_isSelected) {
              _isSelected = false;
              widget.seatingPlan.isSelected = _isSelected;
            } else {
              _isSelected = true;
              widget.seatingPlan.isSelected = _isSelected;
            }
            widget.seatSelected.call(widget.seatingPlan);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_3),
        child: Image.asset(
          "ic_chair_single.png".toAssetIcon(),
          width: MARGIN_XLARGE,
          color: widget.seatingPlan.type == SEAT_TYPE_TAKEN
              ? SEARCH_BOX_COLOR
              : _isSelected
                  ? PRIMARY_COLOR
                  : Colors.white,
        ),
      ),
    );
  }
}
