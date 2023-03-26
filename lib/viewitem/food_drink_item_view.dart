import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/snack_vo.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/quantity_control_view.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class FoodDrinkItemView extends StatefulWidget {
  final SnackVo snack;
  final Function(SnackVo) onQtyChanged;

  FoodDrinkItemView({required this.snack, required this.onQtyChanged});

  @override
  State<FoodDrinkItemView> createState() => _FoodDrinkItemViewState();
}

class _FoodDrinkItemViewState extends State<FoodDrinkItemView> {
  // int _quantity = 0;

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
              Expanded(
                child: Center(
                  child: Image.network(
                    widget.snack.image.orEmpty,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_2),
              Text(
                widget.snack.name.orEmpty,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_REGULAR,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              Text(
                "${widget.snack.price.toMMK} KS",
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              widget.snack.qty == 0
                  ? AddToCartBtnView(() {
                      setState(() {
                        widget.snack.qty = 1;
                        widget.onQtyChanged.call(widget.snack);
                      });
                    })
                  : ItemQuantityControlView(
                      snackVo: widget.snack,
                      onQtyChanged: widget.onQtyChanged,
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
  final SnackVo snackVo;
  final Function(SnackVo) onQtyChanged;

  ItemQuantityControlView({required this.snackVo, required this.onQtyChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            QuantityControlView(
              snackVo: snackVo,
              onQtyChanged: onQtyChanged,
            ),
          ],
        ),
      ],
    );
  }
}
