import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';

import '../resource/dimens.dart';

class ActorItemView extends StatelessWidget {
  const ActorItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CAST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MARGIN_XLARGE,
            backgroundImage: NetworkImage(
              "https://www.pinkvilla.com/imageresize/tom_holland_10.jpg?width=752&t=pvorg",
            ),
            backgroundColor: SEARCH_BOX_COLOR,
          ),
          Text(
            "Tom Holand Macthew",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_SMALL,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
