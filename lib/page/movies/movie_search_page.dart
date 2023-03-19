import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../../viewitem/movie_card_item_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_search_view.dart';
import '../../widget/empty_data_view.dart';
import '../../widget/filter_dropdown_view.dart';
import 'movie_detail_page.dart';

class MovieSearchPage extends StatefulWidget {
  final int tabIndex;
  bool _searchState = false;

  MovieSearchPage(this.tabIndex);

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: false,
        elevation: 0,
        title: AppBarSearchView("Search the movie", () {
          setState(() {
            widget._searchState = true;
          });
        }),
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
                FilterDropDownView("Genres"),
                FilterDropDownView("Format"),
                Visibility(
                  visible: widget.tabIndex == 1,
                  child: FilterDropDownView("Month"),
                ),
              ],
            ),
          ),
          widget._searchState
              ? Expanded(
                  child: GridView.builder(
                    itemCount: 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                      vertical: MARGIN_MEDIUM_2,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: MARGIN_MEDIUM_3 / 2),
                    itemBuilder: (context, index) => MovieCardItemView(
                        movie: null,
                        onClickItem: (isUpComing) {
                          context.next(MovieDetailPage(isUpComing));
                        }),
                  ),
                )
              : EmptyDataView()
        ],
      ),
    );
  }
}
