import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/booking_checkout_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../../viewitem/food_drink_item_view.dart';
import '../../widget/appbar_action_icon_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/booking_available_info_view.dart';
import '../../widget/quantity_control_view.dart';

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
        actions: appBarActionIconList(context),
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
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
              vertical: MARGIN_MEDIUM_2,
            ),
            child: GestureDetector(
                onTap: () {
                  context.next(BookingCheckoutPage());
                },
                child: FoodDrinkCountAndTotalRowView(false)),
          ),
          const SizedBox(height: MARGIN_MEDIUM_3)
        ],
      ),
    );
  }

  List<Widget> appBarActionIconList(BuildContext context) {
    return [
      AppBarActionIconView(
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      AppBarActionIconView(
        onTap: () {
          context.next(const BookingCheckoutPage());
        },
        child: const Text(
          "SKIP",
          style: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_3),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MARGIN_MEDIUM_2),
                  topRight: Radius.circular(MARGIN_MEDIUM_2))),
          child: Column(
            children: [
              FoodDrinkNamePriceRowView("Large Colaffff", 1700),
              const SizedBox(height: MARGIN_CARD_MEDIUM_2),
              FoodDrinkNamePriceRowView("Large Colaffff", 1700),
              const SizedBox(height: MARGIN_CARD_MEDIUM_2),
              FoodDrinkNamePriceRowView("Large Colaffff", 1700)
            ],
          ),
        ),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_3,
            vertical: MARGIN_MEDIUM_2,
          ),
          child: GestureDetector(
              onTap: () {
                context.next(const BookingCheckoutPage());
              },
              child: FoodDrinkCountAndTotalRowView(true)),
        ),
        const SizedBox(height: MARGIN_MEDIUM_3)
      ],
    );
  }
}

class FoodDrinkCountAndTotalRowView extends StatelessWidget {
  final bool isExpand;

  FoodDrinkCountAndTotalRowView(this.isExpand);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_SMALL),
      decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
      child: Row(
        children: [
          RippleTap(
            onTap: () {
              isExpand
                  ? context.popBack()
                  : showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => FoodDrinkCartView());
            },
            child: FoodCountIconArrowView(isExpand: isExpand),
          ),
          const Spacer(),
          const Text(
            "2,000KS",
            style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
          const Icon(Icons.keyboard_arrow_right_rounded),
          const SizedBox(width: MARGIN_MEDIUM)
        ],
      ),
    );
  }
}

class FoodCountIconArrowView extends StatelessWidget {
  const FoodCountIconArrowView({
    Key? key,
    required this.isExpand,
  }) : super(key: key);

  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FoodCountIconView(),
        Icon(this.isExpand
            ? Icons.keyboard_arrow_up_rounded
            : Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}

class FoodCountIconView extends StatelessWidget {
  const FoodCountIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
            vertical: MARGIN_MEDIUM,
          ),
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
            child: const Text(
              "1",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
              ),
            ),
          ),
        ),
      ],
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
            style: const TextStyle(
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
            style: const TextStyle(
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
