import 'package:dart_extensions/dart_extensions.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/data/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/vos/trailer_video_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/page/booking/booking_cinema_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/widget/ripple_effect.dart';
import 'package:moviebooking/widget/title_text.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../data/vos/actor_vo.dart';
import '../../data/vos/checkout_request_vo.dart';
import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../viewitem/actor_item_view.dart';
import '../../widget/booking_button_view.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  final bool isUpComing;

  MovieDetailPage({required this.movieId, required this.isUpComing});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();
  MovieDetailVo? movieDetail;
  TrailerVideoVo? trailerVideo;
  List<ActorVo>? actorList;

  @override
  void initState() {
    /// Network
    movieBookingModel.getMovieDetails(widget.movieId).then((value) {
      setState(() {
        movieDetail = value;
      });
    }).catchError((error) => debugPrint(error.toString()));

    movieBookingModel.getTrailerVideo(widget.movieId).then((value) {
      setState(() {
        trailerVideo = value;
      });
    }).catchError((error) => debugPrint(error.toString()));

    movieBookingModel.getCreditsByMovie(widget.movieId).then((value) {
      setState(() {
        actorList = value;
      });
    }).catchError((error) => debugPrint(error.toString()));

    /// Db
    movieBookingModel.getMovieDetailFromDb(widget.movieId).then((value) {
      setState(() {
        movieDetail = value;
        debugPrint("Data ==> " + movieDetail.toString());
      });
    }).catchError((error) => debugPrint(error.toString()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: context.getScreenHeightBy(2.3),
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          heightFactor: 0.6,
                          widthFactor: 1,
                          child: MovieLandscapeVideoSection(trailerVideo),
                        ),
                        Positioned(
                            bottom: 0,
                            right: MARGIN_MEDIUM_3,
                            left: MARGIN_MEDIUM_3,
                            child: movieDetail == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : MoviePortraitAndInfoViewSection(movieDetail!))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: MARGIN_MEDIUM_3,
                      right: MARGIN_MEDIUM_3,
                      top: MARGIN_MEDIUM_2,
                      bottom: MARGIN_XLARGE,
                    ),
                    child: Column(
                      children: [
                        const MovieDataViewSection(),
                        const SizedBox(height: MARGIN_LARGE),
                        Visibility(
                          visible: this.widget.isUpComing,
                          child: const SetNotificationViewSection(),
                        ),
                        const SizedBox(height: MARGIN_LARGE),
                        MovieStoryLineAndDescViewSection(
                            (movieDetail?.overview).orEmpty),
                        const SizedBox(height: MARGIN_XLARGE),
                        actorList == null
                            ? const CircularProgressIndicator()
                            : ActorListSection(actorList!),
                        const SizedBox(height: MARGIN_XXLARGE * 2)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MARGIN_LARGE,
              left: 0,
              right: 0,
              child: Visibility(
                visible: !widget.isUpComing,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    BookingButtonView(
                      btnText: "Booking",
                      btnClick: () {
                        context.next(BookingCinemaPage(CheckoutRequestVo(
                            movieId: widget.movieId,
                            movieName: (movieDetail?.title).orEmpty)));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SetNotificationViewSection extends StatelessWidget {
  const SetNotificationViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
              child: Image.asset(
                "bg_notify.png".toAssetImage(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Releasin in 5 days",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Text(
                  "Get notify as soon as movie\nbooking opens up in your city!",
                  style: TextStyle(
                    color: TEXT_GREY_COLOR,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
                SetNotificationBtnView()
              ],
            ),
          ),
          Positioned(
            right: MARGIN_MEDIUM_3,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "notify_person.png".toAssetImage(),
              scale: 4,
            ),
          )
        ],
      ),
    );
  }
}

class SetNotificationBtnView extends StatelessWidget {
  const SetNotificationBtnView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM,
      ),
      decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(
            MARGIN_MEDIUM,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.notifications_active,
            color: Colors.black,
          ),
          SizedBox(width: MARGIN_MEDIUM),
          Text(
            "Set Notification",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ActorListSection extends StatelessWidget {
  List<ActorVo> actorList;

  ActorListSection(this.actorList);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("Cast"),
        const SizedBox(height: MARGIN_MEDIUM_2),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: actorList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ActorItemView(actorList[index]),
          ),
        )
      ],
    );
  }
}

class MovieStoryLineAndDescViewSection extends StatelessWidget {
  final String storyLine;

  MovieStoryLineAndDescViewSection(this.storyLine);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_STORY_LINE),
        const SizedBox(height: MARGIN_MEDIUM_2),
        Text(
          storyLine,
          style: const TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class MovieDataViewSection extends StatelessWidget {
  const MovieDataViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MovieDataCardView("Censor Rating", "U/A"),
        const SizedBox(width: MARGIN_MEDIUM),
        MovieDataCardView("Release Date", "May 8th, 2022"),
        const SizedBox(width: MARGIN_MEDIUM),
        MovieDataCardView("Duration", "2hr 50min"),
      ],
    );
  }
}

class MovieDataCardView extends StatelessWidget {
  final String title;
  final String value;

  MovieDataCardView(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM,
          vertical: MARGIN_MEDIUM_2,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            MARGIN_MEDIUM,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieLandscapeVideoSection extends StatelessWidget {
  final TrailerVideoVo? trailerVideo;

  MovieLandscapeVideoSection(this.trailerVideo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: trailerVideo != null
              ? _MovieLandscapeVideoView(trailerVideo!)
              : Container(),
        ),
        IgnorePointer(
          child: Positioned.fill(
            child: Container(
              color: Colors.black26,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
            child: RippleTap(
              onTap: () {
                context.popBack();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM_2),
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.center,
        //   child: Image.asset(
        //     "ic_play_button.png".toAssetIcon(),
        //     scale: 3,
        //   ),
        // )
      ],
    );
  }
}

class _MovieLandscapeVideoView extends StatefulWidget {
  final TrailerVideoVo trailerVideo;

  _MovieLandscapeVideoView(this.trailerVideo);

  @override
  State<_MovieLandscapeVideoView> createState() =>
      _MovieLandscapeVideoViewState();
}

class _MovieLandscapeVideoViewState extends State<_MovieLandscapeVideoView> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailerVideo.key.orEmpty,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    )..addListener(listener);
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {
        _controller.addListener(listener);
      },
    );
  }
}

class MoviePortraitAndInfoViewSection extends StatelessWidget {
  final MovieDetailVo movieDetail;

  MoviePortraitAndInfoViewSection(this.movieDetail);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MoviePortraitImageView("$IMAGE_BASE_URL${movieDetail.posterPath}"),
        const SizedBox(width: MARGIN_MEDIUM_2),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieTitleAndImdbView(movieDetail),
              const SizedBox(height: MARGIN_MEDIUM),
              const Text(
                "2D, 3D, 3D IMAX, 3D DBOX",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_SMALL,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              Wrap(
                runSpacing: -MARGIN_MEDIUM,
                spacing: MARGIN_MEDIUM,
                children: (movieDetail.genres
                        ?.map((e) => GenreChipView(e.name.orEmpty))
                        .toList())
                    .orEmptyObject,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MoviePortraitImageView extends StatelessWidget {
  final String imageUrl;

  MoviePortraitImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: context.getScreenWidthBy(3),
      height: context.getScreenHeightBy(5),
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: PRIMARY_COLOR,
      label: Text(
        genreText,
        style: const TextStyle(
          fontSize: TEXT_SMALL,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MovieTitleAndImdbView extends StatelessWidget {
  final MovieDetailVo movieDetail;

  MovieTitleAndImdbView(this.movieDetail);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            movieDetail.title.orEmpty,
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            const SizedBox(width: MARGIN_MEDIUM_2),
            Image.asset(
              "imdb_logo.png".toAssetImage(),
              height: MARGIN_LARGE + MARGIN_SMALL,
            ),
            const SizedBox(width: 2),
            Text(
              movieDetail.voteAverage.orZero.roundToDouble().toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        )
      ],
    );
  }
}
