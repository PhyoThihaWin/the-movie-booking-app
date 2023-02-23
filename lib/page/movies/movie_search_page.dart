import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../../viewitem/movie_card_item_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import 'movie_detail_page.dart';

class MovieSearchPage extends StatelessWidget {
  final int tabIndex;

  MovieSearchPage(this.tabIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: false,
        elevation: 0,
        title: _AppBarSearchView(),
        leading: AppBarBackIconView(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "ic_filter.png".toAssetIcon(),
                width: MARGIN_LARGE,
                height: MARGIN_LARGE,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_MEDIUM,
            ),
            child: Row(
              children: [
                _FilterDropDownView("Genres"),
                SizedBox(width: MARGIN_MEDIUM_2),
                _FilterDropDownView("Format"),
                SizedBox(width: MARGIN_MEDIUM_2),
                _FilterDropDownView("Month"),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: MARGIN_MEDIUM_3 / 2),
              itemBuilder: (context, index) =>
                  MovieCardItemView(tabIndex, (isUpComing) {
                context.next(MovieDetailPage(isUpComing));
              }),
            ),
          )
        ],
      ),
    );
  }
}

class _FilterDropDownView extends StatelessWidget {
  final String text;

  _FilterDropDownView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_SMALL),
      ),
      padding: EdgeInsets.all(MARGIN_SMALL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MARGIN_SMALL),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: TEXT_REGULAR,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: TEXT_GREY_COLOR,
          )
        ],
      ),
    );
  }
}

class _AppBarSearchView extends StatelessWidget {
  const _AppBarSearchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.search, color: Colors.white),
        Flexible(
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: HOME_SCREEN_BACKGROUND_COLOR,
                hintText: "Search the movie",
                hintStyle: TextStyle(
                  color: TEXT_GREY_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                ),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
