import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../../viewitem/food_drink_item_view.dart';
import '../../widget/appbar_action_icon_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/booking_available_info_view.dart';

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
          FoodDrinkCartView(),
          SizedBox(height: MARGIN_MEDIUM_3)
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

class FoodDrinkCartView extends StatefulWidget {
  @override
  State<FoodDrinkCartView> createState() => _FoodDrinkCartViewState();
}

class _FoodDrinkCartViewState extends State<FoodDrinkCartView> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: _isExpand,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_3),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MARGIN_MEDIUM_2),
                    topRight: Radius.circular(MARGIN_MEDIUM_2))),
            child: Column(
              children: [
                FoodDrinkNamePriceRowView("Large Colaffff", 1700),
                SizedBox(height: MARGIN_CARD_MEDIUM_2),
                FoodDrinkNamePriceRowView("Large Colaffff", 1700),
                SizedBox(height: MARGIN_CARD_MEDIUM_2),
                FoodDrinkNamePriceRowView("Large Colaffff", 1700)
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_3,
            vertical: MARGIN_MEDIUM_2,
          ),
          child: FoodDrinkCountAndTotalRowView(() {
            setState(() {
              _isExpand = !_isExpand;
            });
          }),
        ),
      ],
    );
  }
}

class FoodDrinkCountAndTotalRowView extends StatelessWidget {
  final Function onExpand;

  FoodDrinkCountAndTotalRowView(this.onExpand);

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        onExpand();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: MARGIN_SMALL),
        decoration: BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
        child: Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM),
                  child: Image.asset(
                    "ic_drink_food.png".toAssetIcon(),
                    height: MARGIN_XLARGE,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: MARGIN_SMALL,
                  top: 0,
                  child: CircleDotView(
                    itemColor: Colors.red,
                    padding: MARGIN_6,
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_down_rounded),
            Spacer(),
            Text(
              "2,000KS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600),
            ),
            Icon(Icons.keyboard_arrow_right_rounded),
            SizedBox(width: MARGIN_MEDIUM)
          ],
        ),
      ),
    );
  }
}

class FoodDrinkNamePriceRowView extends StatelessWidget {
  final String itemName;
  final int itemPrice;

  FoodDrinkNamePriceRowView(this.itemName, this.itemPrice);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            itemName,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
            child: Center(
          child: QuantityControlView(),
        )),
        Expanded(
          child: Text(
            "${itemPrice} Ks",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class QuantityControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleDotView(
          itemColor: PRIMARY_COLOR,
          padding: MARGIN_SMALL,
          child: Icon(
            Icons.add,
            size: MARGIN_MEDIUM_2,
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Text(
          "1",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        CircleDotView(
          itemColor: PRIMARY_COLOR,
          padding: MARGIN_SMALL,
          child: Icon(
            Icons.remove,
            size: MARGIN_MEDIUM_2,
          ),
        )
      ],
    );
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
