import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';
import '../resource/strings.dart';

class PolicyTextBottomView extends StatelessWidget {
  const PolicyTextBottomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      TERMS_AND_CONDITION_TITLE,
      style: TextStyle(
          color: TEXT_GREY_COLOR,
          fontSize: TEXT_SMALL,
          fontWeight: FontWeight.w400),
    );
  }
}
