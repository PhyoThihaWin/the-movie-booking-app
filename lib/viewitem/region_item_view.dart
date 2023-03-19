import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../data/model/vos/city_vo.dart';
import '../resource/dimens.dart';

class RegionItemView extends StatelessWidget {
  final void Function() onTapRegion;
  final CityVo city;

  RegionItemView({required this.city, required this.onTapRegion});

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: onTapRegion,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_MEDIUM_3,
              ),
              child: Text(
                city.name.orEmpty,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
