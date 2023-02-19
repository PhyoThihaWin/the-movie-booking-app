import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/resource/dimens.dart';

class RippleTap extends StatelessWidget {
  final Widget child;
  final bool isCircle;
  final Function? onTap;

  const RippleTap({
    Key? key,
    required this.child,
    this.onTap,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(MARGIN_SMALL),
              ),
              customBorder: isCircle ? const CircleBorder() : null,
              onTap: onTap == null
                  ? null
                  : () {
                      onTap?.call();
                    },
            ),
          ),
        ),
      ],
    );
  }
}
