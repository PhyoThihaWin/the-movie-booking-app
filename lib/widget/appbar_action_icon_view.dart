import 'package:flutter/material.dart';

import '../resource/dimens.dart';

class AppBarActionIconView extends StatelessWidget {
  final Widget child;

  AppBarActionIconView({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
      ),
      child: Center(child: child),
    );
  }
}
