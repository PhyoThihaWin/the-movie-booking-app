import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviebooking/model/booking_date.dart';
import 'package:moviebooking/resource/strings.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../../viewitem/booking_date_item_view.dart';
import '../../viewitem/cinema_parent_item_view.dart';
import '../../widget/booking_available_info_view.dart';
import '../../widget/ripple_effect.dart';
import '../home_page.dart';

class BookingCinemaPage extends StatelessWidget {
  List<String> movieTypeList = ["2D", "3D", "3D IMAX", "3D DBOX"];
  List<String> cinemaList = [
    CINEMA_SOLD_OUT,
    CINEMA_SOLD_OUT,
    CINEMA_AVAILABLE,
    CINEMA_ALMOST_FULL,
    CINEMA_AVAILABLE,
    CINEMA_FILLING_FAST,
    CINEMA_AVAILABLE,
    CINEMA_FILLING_FAST
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
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
        actions: appBarActionIconList(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.getScreenHeightBy(6),
              child: BookingDateListViewSection(),
            ),
            SizedBox(height: MARGIN_MEDIUM_2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  movieTypeList.map((e) => MovieTypeContainerView(e)).toList(),
            ),
            SizedBox(height: MARGIN_XLARGE),
            Container(
              color: SEARCH_BOX_COLOR,
              padding: EdgeInsets.symmetric(vertical: MARGIN_6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BookingAvailabilityInfoView("Available", PRIMARY_COLOR),
                  BookingAvailabilityInfoView(
                      "Filling Fast", Colors.orange.shade700),
                  BookingAvailabilityInfoView("Almost Full", Colors.pinkAccent),
                ],
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CinemaParentItemView(cinemaList),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> appBarActionIconList() {
    return const [
      AppBarCityTitleView(),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3,
        ),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          right: MARGIN_MEDIUM_3,
        ),
        child: Icon(
          Icons.filter_alt,
          color: Colors.white,
        ),
      ),
    ];
  }
}

class MovieTypeContainerView extends StatelessWidget {
  final String movieType;

  MovieTypeContainerView(this.movieType);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TEXT_GREY_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_6),
          border: Border.all(
            color: Colors.white54,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_10,
          vertical: MARGIN_6,
        ),
        child: Text(
          movieType,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ),
    );
  }
}

class BookingDateListViewSection extends StatefulWidget {
  @override
  State<BookingDateListViewSection> createState() =>
      _BookingDateListViewSectionState();
}

class _BookingDateListViewSectionState
    extends State<BookingDateListViewSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var dateList = getBookingDateList(10);
    return ListView.builder(
      itemCount: dateList.length,
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_CARD_MEDIUM_2,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => BookingDateItemView(
        dateList[index],
        selectedIndex == index,
        () {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  List<BookingDate> getBookingDateList(int length) {
    final _currentDate = DateTime.now();
    final _dayNameFormatter = DateFormat('EEE');
    final _dateFormatter = DateFormat('d');
    final _monthFormatter = DateFormat('MMM');
    final bookingDateList = <BookingDate>[];

    for (int i = 0; i < length; i++) {
      final date = _currentDate.add(Duration(days: i));
      var dayName = _dayNameFormatter.format(date).toUpperCase();
      switch (i) {
        case 0:
          dayName = "Today";
          break;
        case 1:
          dayName = "Tomorrow";
          break;
      }
      bookingDateList.add(
        BookingDate(
          dayName: dayName,
          monthName: _monthFormatter.format(date),
          date: _dateFormatter.format(date),
        ),
      );
    }
    return bookingDateList;
  }
}
