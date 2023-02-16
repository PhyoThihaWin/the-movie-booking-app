import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/viewitem/sliver_app_bar_title.dart';
import 'package:moviebooking/widget/title_text.dart';

import '../../widget/appbar_action_icon_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/ripple_effect.dart';

class BuySnackPage extends StatelessWidget {
  final List<String> tabList = [
    "All",
    "Combo",
    "Snack",
    "Pop Corn",
    "Beverage"
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
            child: DefaultTabController(
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
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                  left: MARGIN_MEDIUM_3,
                  right: MARGIN_MEDIUM_3,
                  top: MARGIN_MEDIUM_3,
                  bottom: MARGIN_XXLARGE),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: MARGIN_MEDIUM_2,
                mainAxisSpacing: MARGIN_MEDIUM_2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(MARGIN_10),
                      child: Image.asset(
                        "bg_snack_item.png".toAssetImage(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
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
        child: Text(
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

class AppBarTitleView extends StatelessWidget {
  final String titleText;

  AppBarTitleView(this.titleText);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
