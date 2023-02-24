import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class FilterDropDownView extends StatelessWidget {
  final String text;

  FilterDropDownView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      padding: const EdgeInsets.all(MARGIN_SMALL),
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: MARGIN_SMALL),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: TEXT_REGULAR,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: TEXT_GREY_COLOR,
          )
        ],
      ),
    );
  }
}
