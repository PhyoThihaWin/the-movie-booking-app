import 'package:flutter/material.dart';

import '../resource/dimens.dart';

class EmptyDataView extends StatelessWidget {
  const EmptyDataView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        child: Icon(
          Icons.hourglass_empty,
          size: MARGIN_XXLARGE,
          color: Colors.white,
        ),
      ),
    );
  }
}
