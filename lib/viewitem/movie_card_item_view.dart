import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';
import '../widget/gradient_view.dart';

class MovieCardItemView extends StatelessWidget {
  final MovieVo? movie;
  final Function(bool isUpComing) onClickItem;

  MovieCardItemView({required this.movie, required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return RippleTap(
      onTap: () {
        onClickItem((movie?.isComingSoon).orFalse);
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
              child: MovieImageView(movie),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: MARGIN_10,
                right: MARGIN_10,
                bottom: MARGIN_MEDIUM_2,
              ),
              child: Column(
                children: [
                  movie == null ? Container() : MovieTitleAndImdbView(movie!),
                  const SizedBox(height: MARGIN_MEDIUM),
                  const MovieResolutionTypeView()
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
        const Text(
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
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        const Text(
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
  final MovieVo movie;

  MovieTitleAndImdbView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            movie.originalTitle.orEmpty,
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            Image.asset(
              "imdb_logo.png".toAssetImage(),
              height: MARGIN_LARGE,
            ),
            const SizedBox(width: 2),
            const Text(
              "9.0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_SMALL,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        )
      ],
    );
  }
}

class MovieImageView extends StatelessWidget {
  final MovieVo? movie;

  MovieImageView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "$IMAGE_BASE_URL${(movie?.posterPath).orEmpty}",
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
            visible: (movie?.isComingSoon).orFalse,
            child: Container(
              margin: const EdgeInsets.all(MARGIN_MEDIUM),
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_10,
                vertical: MARGIN_SMALL,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  color: PRIMARY_COLOR),
              child: Text(
                (movie?.releaseDate).orEmpty.formatDate(format: "MMM dd"),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_SMALL,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
