import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviebooking/model/booking_date.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import '../viewitem/booking_date_item_view.dart';
import 'home_page.dart';

class CinemaSelectPage extends StatelessWidget {
  const CinemaSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(
            left: MARGIN_MEDIUM_3,
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: appBarActionIconList(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.getScreenHeightBy(6),
                child: BookingDateListViewSection(),
              ),
              Container(
                color: Colors.green,
                height: 400,
                width: double.maxFinite,
              ),
              Container(
                color: Colors.red,
                height: 400,
                width: double.maxFinite,
              )
            ],
          ),
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

class BookingDateListViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dateList = getBookingDateList(10);
    return ListView.builder(
      itemCount: dateList.length,
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          BookingDateItemView(dateList[index], index),
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
      var dayName = _dayNameFormatter.format(date);
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
          dayName: dayName.toUpperCase(),
          monthName: _monthFormatter.format(date),
          date: _dateFormatter.format(date),
        ),
      );
    }
    return bookingDateList;
  }
}
