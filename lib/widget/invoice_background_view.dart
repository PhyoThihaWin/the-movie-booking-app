import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/dimens.dart';

class InvoiceBackgroundImageView extends StatelessWidget {
  const InvoiceBackgroundImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      child: Image.asset(
        "bg_checkout_invoice.png".toAssetImage(),
        fit: BoxFit.cover,
      ),
    );
  }
}
