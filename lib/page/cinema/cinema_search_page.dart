import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../viewitem/cinema_parent_item_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_search_view.dart';
import '../../widget/empty_data_view.dart';
import '../../widget/filter_dropdown_view.dart';

class CinemaSearchPage extends StatefulWidget {

  bool _searchState = false;

  @override
  State<CinemaSearchPage> createState() => _CinemaSearchPageState();
}

class _CinemaSearchPageState extends State<CinemaSearchPage> {
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
        centerTitle: false,
        elevation: 0,
        title: AppBarSearchView("Search the cinema", () {
          setState(() {
            widget._searchState = true;
          });
        }),
        leading: AppBarBackIconView(),
        actions: const [
          ActionBtnFilterView(),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_MEDIUM,
            ),
            child: Row(
              children: [
                FilterDropDownView("Facilities"),
                FilterDropDownView("Format"),
              ],
            ),
          ),
          widget._searchState
              ? Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: MARGIN_MEDIUM_2),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_3,
                            vertical: MARGIN_MEDIUM_2,
                          ),
                          child: PriceRangeSliderViewSection(
                            title: "Price Range",
                            suffix: "Ks",
                            minValue: 3500,
                            maxValue: 29500,
                            currentValue: 12000,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_3,
                            vertical: MARGIN_MEDIUM_2,
                          ),
                          child: PriceRangeSliderViewSection(
                            title: "Show Times",
                            suffix: "AM",
                            minValue: 8,
                            maxValue: 12,
                            currentValue: 10,
                          ),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CinemaParentItemView(cinemaList),
                        )
                      ],
                    ),
                  ),
                )
              : EmptyDataView()
        ],
      ),
    );
  }
}

class ActionBtnFilterView extends StatelessWidget {
  const ActionBtnFilterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Image.asset(
          "ic_filter.png".toAssetIcon(),
          width: MARGIN_LARGE,
          height: MARGIN_LARGE,
        ));
  }
}

class PriceRangeSliderViewSection extends StatelessWidget {
  final String title;
  final String suffix;
  final double minValue;
  final double maxValue;
  final double currentValue;

  PriceRangeSliderViewSection(
      {required this.title,
      required this.suffix,
      required this.minValue,
      required this.maxValue,
      required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          children: [
            Text(
              "${minValue.round().toString()}$suffix",
              style: const TextStyle(
                color: TEXT_GREY_COLOR,
                fontSize: TEXT_REGULAR,
              ),
            ),
            const Spacer(),
            Text(
              "${maxValue.round().toString()}$suffix",
              style: const TextStyle(
                color: TEXT_GREY_COLOR,
                fontSize: TEXT_REGULAR,
              ),
            )
          ],
        ),
        RangeSliderView(
            minValue: minValue, maxValue: maxValue, currentValue: currentValue)
      ],
    );
  }
}

class RangeSliderView extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;

  RangeSliderView({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
  });

  late RangeValues _currentRangeValues = RangeValues(minValue, currentValue);

  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: widget._currentRangeValues,
      max: widget.maxValue,
      min: widget.minValue,
      labels: RangeLabels(
        widget._currentRangeValues.start.round().toString(),
        widget._currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          widget._currentRangeValues = values;
        });
      },
    );
  }
}
