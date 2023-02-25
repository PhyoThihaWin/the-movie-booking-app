import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/quantity_control_view.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class FoodDrinkItemView extends StatefulWidget {
  @override
  State<FoodDrinkItemView> createState() => _FoodDrinkItemViewState();
}

class _FoodDrinkItemViewState extends State<FoodDrinkItemView> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_10),
            child: Image.asset(
              "bg_snack_item.png".toAssetImage(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "dummy_food.png".toAssetImage(),
                  scale: 5,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_2),
              const Text(
                "Potato Chips",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_REGULAR,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              const Text(
                "10,000KS",
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              _quantity == 0
                  ? AddToCartBtnView(() {
                      setState(() {
                        _quantity = 1;
                      });
                    })
                  : ItemQuantityControlView(
                      onClickPlus: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      onClickMinus: () {
                        setState(() {
                          _quantity--;
                        });
                      },
                      quantity: _quantity,
                    ),
            ],
          ),
        )
      ],
    );
  }
}

class AddToCartBtnView extends StatelessWidget {
  final Function onClickAdd;

  AddToCartBtnView(this.onClickAdd);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextButton(
        onPressed: () {
          onClickAdd();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
        ),
        child: const Text(
          "ADD",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class ItemQuantityControlView extends StatelessWidget {
  final Function? onClickPlus;
  final Function? onClickMinus;
  final int? quantity;

  ItemQuantityControlView(
      {this.onClickPlus, this.onClickMinus, this.quantity = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            QuantityControlView(
              onClickPlus: () {
                onClickPlus?.call();
              },
              onClickMinus: () {
                onClickMinus?.call();
              },
              qunatity: quantity,
            ),
          ],
        ),
      ],
    );
  }
}
