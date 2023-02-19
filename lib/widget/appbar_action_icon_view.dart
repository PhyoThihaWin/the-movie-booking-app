import 'package:flutter/material.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';

class AppBarActionIconView extends StatelessWidget {
  final Widget child;
  final Function? onTap;

  AppBarActionIconView({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_3,
        ),
        child: Center(child: child),
      ),
    );
  }
}
