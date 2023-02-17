import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class FoodDrinkItemView extends StatelessWidget {
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
                  scale: 4,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_2),
              const Text(
                "Potato Chips",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_REGULAR,
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              const Text(
                "10,000KS",
                style: const TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM),
              SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: null,
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
              )
            ],
          ),
        )
      ],
    );
  }
}
