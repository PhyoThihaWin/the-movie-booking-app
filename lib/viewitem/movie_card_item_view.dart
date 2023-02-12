import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';
import '../widget/gradient_view.dart';

class MovieCardItemView extends StatelessWidget {
  final tabIndex;
  final Function(bool isUpComing) onClickItem;

  MovieCardItemView(this.tabIndex, this.onClickItem);

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        onClickItem((tabIndex == 0) ? false : true);
      },
      child: Card(
        color: Colors.black,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MARGIN_6),
        ),
        child: Column(
          children: [
            Expanded(
              child: MovieImageView(tabIndex),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: MARGIN_10,
                right: MARGIN_10,
                bottom: MARGIN_MEDIUM_2,
              ),
              child: Column(
                children: [
                  MovieTitleAndImdbView(),
                  SizedBox(height: MARGIN_MEDIUM),
                  MovieResolutionTypeView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieResolutionTypeView extends StatelessWidget {
  const MovieResolutionTypeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "U/A",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        Container(
          height: MARGIN_6,
          width: MARGIN_MEDIUM_3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        Text(
          "2D, 3D, 3D IMAX",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_SMALL,
          ),
        )
      ],
    );
  }
}

class MovieTitleAndImdbView extends StatelessWidget {
  const MovieTitleAndImdbView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Moana II",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Image.asset(
          "imdb_logo.png".toAssetImage(),
          height: MARGIN_XLARGE,
        ),
        SizedBox(width: 2),
        Text(
          "9.0",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class MovieImageView extends StatelessWidget {
  final tabIndex;

  MovieImageView(this.tabIndex);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            (tabIndex == 0)
                ? "https://cdn.shopify.com/s/files/1/0969/9128/products/Oppenheimer-CillianMurphy-ChristopherNolan-HollywoodMoviePoster_1_f2b4d54a-6a90-4df1-b2e8-5cd7949d4c2c.jpg?v=1647424460"
                : "https://cdn.programadoresbrasil.com.br/wp-content/uploads/2022/11/22093548934085-600x694.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          child: GradientView(
            height: MARGIN_XXLARGE,
          ),
          alignment: Alignment.bottomCenter,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Visibility(
            visible: (tabIndex == 0) ? false : true,
            child: Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM),
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_10,
                vertical: MARGIN_SMALL,
              ),
              child: Text(
                "9th\nAug",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_SMALL,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  color: PRIMARY_COLOR),
            ),
          ),
        )
      ],
    );
  }
}
