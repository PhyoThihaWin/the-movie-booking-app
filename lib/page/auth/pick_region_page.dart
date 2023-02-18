import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/colors.dart';
import '../../resource/strings.dart';
import '../../viewitem/region_item_view.dart';

class PickRegionPage extends StatelessWidget {
  const PickRegionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppBarTitleView(),
      ),
      body: Container(
        width: double.maxFinite,
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_LARGE,
              ),
              child: SearchRegionBoxSection(),
            ),
            const SizedBox(height: MARGIN_LARGE),
            const Align(
              alignment: Alignment.centerRight,
              child: BuildingImageView(),
            ),
            RegionListHeaderView(),
            Expanded(
              child: CityListBuilderView(),
            )
          ],
        ),
      ),
    );
  }
}

class CityListBuilderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return RegionItemView(() => context.next(const HomePage()));
      },
    );
  }
}

class RegionListHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: SEARCH_BOX_COLOR,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: MARGIN_CARD_MEDIUM_2,
          horizontal: MARGIN_MEDIUM_3,
        ),
        child: Text(
          CITIES_TITLE_TEXT,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ),
    );
  }
}

class BuildingImageView extends StatelessWidget {
  const BuildingImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "region_building.png".toAssetImage(),
      width: MARGIN_XXLARGE * 2.5,
    );
  }
}

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      PICK_REGION_TEXT,
      style: TextStyle(
        color: PRIMARY_COLOR,
        fontWeight: FontWeight.bold,
        fontSize: TEXT_REGULAR_3X,
      ),
    );
  }
}

class SearchRegionBoxSection extends StatelessWidget {
  const SearchRegionBoxSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SearchBoxView(),
          ),
          SizedBox(width: MARGIN_MEDIUM_2),
          NavigateBtnView()
        ],
      ),
    );
  }
}

class NavigateBtnView extends StatelessWidget {
  const NavigateBtnView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2,
        ),
        child: SvgPicture.asset(
          "ic_navigate.svg".toAssetIcon(),
          color: HOME_SCREEN_BACKGROUND_COLOR,
          width: MARGIN_MEDIUM_3,
        ),
      ),
    );
  }
}

class SearchBoxView extends StatelessWidget {
  const SearchBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SEARCH_BOX_COLOR,
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: PRIMARY_COLOR,
            ),
            SizedBox(width: MARGIN_CARD_MEDIUM_2),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: SEARCH_YOUR_LOCATION,
                    hintStyle: TextStyle(color: TEXT_GREY_COLOR)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
