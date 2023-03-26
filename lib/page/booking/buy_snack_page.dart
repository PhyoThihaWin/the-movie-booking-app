import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/checkout_request_vo.dart';
import 'package:moviebooking/data/vos/snack_category_vo.dart';
import 'package:moviebooking/data/vos/snack_vo.dart';
import 'package:moviebooking/page/booking/booking_checkout_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/dimens.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../viewitem/food_drink_item_view.dart';
import '../../widget/appbar_action_icon_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_title_view.dart';
import '../../widget/booking_available_info_view.dart';
import '../../widget/quantity_control_view.dart';

class BuySnackPage extends StatefulWidget {
  final CheckoutRequestVo checkRequest;

  BuySnackPage(this.checkRequest);

  @override
  State<BuySnackPage> createState() => _BuySnackPageState();
}

class _BuySnackPageState extends State<BuySnackPage> {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  List<SnackCategoryVo>? tabList;
  List<SnackVo>? snackList;
  List<SnackVo> snackCartList = [];

  @override
  void initState() {
    debugPrint("Checkout request ==> ${widget.checkRequest.toJson()}");
    movieBookingModel.getSnackCategories().then((value) {
      setState(() {
        tabList = value;
        _getSnacksByCategory(0);
      });
    }).catchError((error) => debugPrint(error.toString()));

    super.initState();
  }


  void _getSnacksByCategory(int categoryId) {
    movieBookingModel.getSnacksByCategory(categoryId).then((value) {
      setState(() {
        snackList = value;
        for (var element in snackCartList) {
          snackList?.where((item) => item.id == element.id).firstOrNull?.qty =
              element.qty;
        }
      });
    }).catchError((error) => debugPrint(error.toString()));
  }

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
            child: tabList == null
                ? Container()
                : FoodTypeTabBarView(
                    tabList: tabList!,
                    onTapChanged: (index) {
                      _getSnacksByCategory(tabList![index].id.orZero);
                    },
                  ),
          ),
          Expanded(
            child: snackList == null
                ? const Center(child: CircularProgressIndicator())
                : FoodDrinkGridView(
                    snackList: snackList!,
                    onQtyChanged: (snack) {
                      setState(() {
                        _snackListOnQtyChanged(snack);
                      });
                    },
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
                  /// Prepare checkout request
                  widget.checkRequest.snackCartList = snackCartList;
                  context.next(BookingCheckoutPage(widget.checkRequest));
                },
                child: FoodDrinkCountAndTotalRowView(
                  isExpand: false,
                  snackCartList: snackCartList,
                  onQtyChanged: (snack) {
                    _snackListOnQtyChanged(snack);
                  },
                )),
          ),
          const SizedBox(height: MARGIN_MEDIUM_3)
        ],
      ),
    );
  }

  _snackListOnQtyChanged(SnackVo snack) {
    debugPrint("snack ==> ${snack.qty}");
    snackList?.where((element) => element.id == snack.id).first.qty = snack.qty;

    if (snack.qty == 0) {
      snackCartList.removeWhere((element) => element.id == snack.id);
    } else {
      if (snackCartList.find((selector) => selector.id == snack.id) == null) {
        snackCartList.add(snack);
      } else {
        snackCartList.where((element) => element.id == snack.id).first.qty =
            snack.qty;
      }
    }
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
          // context.next(const BookingCheckoutPage());
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
  final List<SnackVo> snackCartList;
  final Function(SnackVo) onQtyChanged;

  FoodDrinkCartView({required this.snackCartList, required this.onQtyChanged});

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
              horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM_2),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MARGIN_MEDIUM_2),
                  topRight: Radius.circular(MARGIN_MEDIUM_2))),
          child: ListView.builder(
            itemCount: widget.snackCartList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => FoodDrinkNamePriceRowView(
              snackVo: widget.snackCartList[index],
              onQtyChanged: widget.onQtyChanged,
            ),
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
                context.popBack();
              },
              child: FoodDrinkCountAndTotalRowView(
                snackCartList: widget.snackCartList,
                isExpand: true,
                onQtyChanged: widget.onQtyChanged,
              )),
        ),
        const SizedBox(height: MARGIN_MEDIUM_3)
      ],
    );
  }
}

class FoodDrinkCountAndTotalRowView extends StatelessWidget {
  final bool isExpand;
  final List<SnackVo> snackCartList;
  final Function(SnackVo) onQtyChanged;

  FoodDrinkCountAndTotalRowView(
      {required this.snackCartList,
      required this.isExpand,
      required this.onQtyChanged});

  @override
  Widget build(BuildContext context) {
    int quantity = snackCartList.length;
    int totalPrice = 0;
    if (snackCartList.isNotEmpty) {
      totalPrice = snackCartList
          .map((item) => item.qty.orZero * item.price.toMMK)
          .reduce((first, second) => first + second);
    }

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
                      builder: (context) => FoodDrinkCartView(
                            snackCartList: snackCartList,
                            onQtyChanged: onQtyChanged,
                          ));
            },
            child: FoodCountIconArrowView(qty: quantity, isExpand: isExpand),
          ),
          const Spacer(),
          Text(
            "$totalPrice KS",
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
  final int qty;
  final bool isExpand;

  FoodCountIconArrowView({required this.qty, required this.isExpand});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FoodCountIconView(qty),
        Icon(this.isExpand
            ? Icons.keyboard_arrow_up_rounded
            : Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}

class FoodCountIconView extends StatelessWidget {
  final int qty;

  FoodCountIconView(this.qty);

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
            child: Text(
              qty.toString(),
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
  final SnackVo snackVo;
  final Function(SnackVo) onQtyChanged;

  FoodDrinkNamePriceRowView(
      {required this.snackVo, required this.onQtyChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                snackVo.name.orEmpty,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: QuantityControlView(
                snackVo: snackVo,
                onQtyChanged: onQtyChanged,
              ),
            )),
            Expanded(
              child: Text(
                "${snackVo.price.toMMK} KS",
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: MARGIN_CARD_MEDIUM_2),
      ],
    );
  }
}

class FoodTypeTabBarView extends StatelessWidget {
  FoodTypeTabBarView({required this.tabList, required this.onTapChanged});

  final List<SnackCategoryVo> tabList;
  final Function(int index) onTapChanged;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: TabBar(
        onTap: (index) {
          onTapChanged.call(index);
        },
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
        tabs: tabList.map((e) => Tab(text: e.title)).toList(),
      ),
    );
  }
}

class FoodDrinkGridView extends StatelessWidget {
  final List<SnackVo> snackList;
  final Function(SnackVo) onQtyChanged;

  FoodDrinkGridView({required this.snackList, required this.onQtyChanged});

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
      itemCount: snackList.length,
      itemBuilder: (context, index) => FoodDrinkItemView(
          snack: snackList[index], onQtyChanged: onQtyChanged),
    );
  }
}
