import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

class AppBarBackIconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        context.popBack();
      },
      isCircle: true,
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    );
  }
}
