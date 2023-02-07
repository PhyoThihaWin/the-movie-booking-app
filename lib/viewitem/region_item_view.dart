import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';

class RegionItemView extends StatelessWidget {
  final void Function() onTapRegion;

  RegionItemView(this.onTapRegion);

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: onTapRegion,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_MEDIUM_3,
              ),
              child: Text(
                "Yangon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
