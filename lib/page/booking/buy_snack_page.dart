import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../viewitem/food_drink_item_view.dart';
import '../../widget/appbar_action_icon_view.dart';
import '../../widget/appbar_back_icon_view.dart';

class BuySnackPage extends StatelessWidget {
  final List<String> tabList = [
    "All",
    "Combo",
    "Snack",
    "Pop Corn",
    "Beverage",
    "Drink",
    "Alcohol"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: AppBarTitleView("Grab a bite!"),
        leading: AppBarBackIconView(),
        actions: appBarActionIconList(),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: FoodTypeTabBarView(tabList: tabList),
          ),
          Expanded(
            child: FoodDrinkGridView(),
          ),
          Container(
            color: PRIMARY_COLOR,
            margin: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_MEDIUM_2,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "ic_drink_food.png".toAssetIcon(),
                      height: MARGIN_XLARGE,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> appBarActionIconList() {
    return [
      AppBarActionIconView(
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      AppBarActionIconView(
        child: const Text(
          "SKIP",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
      )
    ];
  }
}

class FoodTypeTabBarView extends StatelessWidget {
  const FoodTypeTabBarView({
    Key? key,
    required this.tabList,
  }) : super(key: key);

  final List<String> tabList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: TabBar(
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: TEXT_REGULAR,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3,
        ),
        isScrollable: true,
        labelColor: Colors.white,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: PRIMARY_COLOR),
        ),
        tabs: tabList.map((e) => Tab(text: e)).toList(),
      ),
    );
  }
}

class FoodDrinkGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_3,
          right: MARGIN_MEDIUM_3,
          top: MARGIN_MEDIUM_3,
          bottom: MARGIN_XXLARGE),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: MARGIN_MEDIUM_2,
        childAspectRatio: 0.66,
        mainAxisSpacing: MARGIN_MEDIUM_2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => FoodDrinkItemView(),
    );
  }
}

class AppBarTitleView extends StatelessWidget {
  final String titleText;

  AppBarTitleView(this.titleText);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
