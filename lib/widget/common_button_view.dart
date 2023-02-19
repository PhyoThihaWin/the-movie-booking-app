import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class CommonButtonView extends StatelessWidget {
  final Widget child;
  final Function onTap;

  CommonButtonView({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: VERIFY_BTN_HEIGHT,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MARGIN_10),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
