import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/actor_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/resource/colors.dart';

import '../resource/dimens.dart';

class ActorItemView extends StatelessWidget {
  final ActorVo actor;

  ActorItemView(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CAST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MARGIN_XLARGE,
            backgroundImage:
                NetworkImage("$IMAGE_BASE_URL${actor.profilePath}"),
            backgroundColor: SEARCH_BOX_COLOR,
          ),
          Text(
            actor.name.orEmpty,
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
