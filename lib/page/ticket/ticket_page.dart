import 'package:flutter/material.dart';
import 'package:moviebooking/widget/ticket_item_view.dart';

import '../../resource/colors.dart';
import '../../resource/dimens.dart';
import '../../widget/appbar_title_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HOME_SCREEN_BACKGROUND_COLOR,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_3,
            vertical: MARGIN_MEDIUM,
          ),
          child: TicketItemView(),
        ),
      ),
    );
  }
}
