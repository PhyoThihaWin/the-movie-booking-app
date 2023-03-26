import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/page/cinema/cinema_detail_page.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import 'cinema_facility_item_view.dart';
import 'cinema_grid_item_view.dart';

class CinemaParentItemView extends StatefulWidget {
  final CinemaShowTimeVo cinemaShowTime;
  final Function(int) onTimeSlotSelected;

  CinemaParentItemView(
      {required this.cinemaShowTime, required this.onTimeSlotSelected});

  @override
  State<CinemaParentItemView> createState() => _CinemaParentItemViewState();
}

class _CinemaParentItemViewState extends State<CinemaParentItemView> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpand = !_isExpand;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: MARGIN_MEDIUM_3,
              right: MARGIN_MEDIUM_3,
              top: MARGIN_LARGE,
            ),
            child: Column(
              children: [
                CinemaTitleView(widget.cinemaShowTime.cinema.orEmpty),
                const SizedBox(height: MARGIN_MEDIUM_2),
                const CinemaServicesRowView(),
                const SizedBox(height: MARGIN_LARGE),
              ],
            ),
          ),
        ),
        Visibility(
          visible: _isExpand,
          child: Column(
            children: [
              widget.cinemaShowTime.timeslots == null
                  ? Center(child: CircularProgressIndicator())
                  : CinemaScreenGridView(
                      timeSlotList: widget.cinemaShowTime.timeslots!,
                      onTimeSlotSelected: widget.onTimeSlotSelected,
                    ),
              const SizedBox(height: MARGIN_LARGE),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                ),
                child: const LongPressInfoTextView(),
              ),
              const SizedBox(height: MARGIN_LARGE),
            ],
          ),
        ),
        const Divider(color: Colors.white),
      ],
    );
  }
}

class CinemaScreenGridView extends StatelessWidget {
  final List<Timeslots> timeSlotList;
  final Function(int) onTimeSlotSelected;

  CinemaScreenGridView(
      {required this.timeSlotList, required this.onTimeSlotSelected});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: MARGIN_LARGE,
        crossAxisSpacing: MARGIN_LARGE,
      ),
      itemCount: timeSlotList.length,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => CinemaGridItemView(
        timeSlotList[index],
        () {
          onTimeSlotSelected(timeSlotList[index].cinemaDayTimeslotId.orZero);
        },
      ),
    );
  }
}

class CinemaTitleView extends StatelessWidget {
  final String cinemaName;

  CinemaTitleView(this.cinemaName);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cinemaName,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.next(const CinemaDetailPage());
            print("Reached!!");
          },
          child: const Text(
            "See Details",
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontSize: TEXT_REGULAR,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}

class CinemaServicesRowView extends StatelessWidget {
  const CinemaServicesRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CinemaFacilityItemView(
          "Parking",
          "ic_parking.png".toAssetIcon(),
        ),
        CinemaFacilityItemView(
          "Online Food",
          "ic_drink_food.png".toAssetIcon(),
        ),
        CinemaFacilityItemView(
          "Wheek Chair",
          "ic_wheel_chair.png".toAssetIcon(),
        )
      ],
    );
  }
}

class LongPressInfoTextView extends StatelessWidget {
  const LongPressInfoTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.info,
          color: TEXT_GREY_COLOR,
          size: MARGIN_MEDIUM_3,
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "Long press on show timing to see seat class!",
          style: TextStyle(
            color: TEXT_GREY_COLOR,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
