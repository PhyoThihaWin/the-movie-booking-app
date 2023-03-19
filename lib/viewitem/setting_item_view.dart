import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../data/vos/setting.dart';
import '../resource/colors.dart';
import '../resource/dimens.dart';
import '../widget/ripple_effect.dart';

class SettingItemView extends StatelessWidget {
  final Setting setting;
  final bool last;

  SettingItemView(this.setting, this.last);

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3,
        ),
        child: Column(
          children: [
            const SizedBox(height: MARGIN_LARGE),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  setting.image.toAssetIcon(),
                  color: Colors.white,
                  height: MARGIN_LARGE,
                  width: MARGIN_LARGE,
                ),
                const SizedBox(width: MARGIN_MEDIUM_2),
                Text(
                  setting.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: SEARCH_BOX_COLOR,
                )
              ],
            ),
            const SizedBox(height: MARGIN_LARGE),
            Visibility(
              visible: !last,
              child: const Divider(
                color: TEXT_GREY_COLOR,
                height: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
