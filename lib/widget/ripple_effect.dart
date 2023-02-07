import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/resource/dimens.dart';

class RippleTap extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const RippleTap({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(
            MARGIN_SMALL,
          ),
        ),
        child: child,
        onTap: onTap,
      ),
    );
  }
}
