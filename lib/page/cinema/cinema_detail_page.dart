import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:video_player/video_player.dart';

import '../../resource/dimens.dart';
import '../../viewitem/cinema_facility_item_view.dart';
import '../../widget/appbar_back_icon_view.dart';
import '../../widget/appbar_title_view.dart';

class CinemaDetailPage extends StatelessWidget {
  const CinemaDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        centerTitle: true,
        elevation: 0,
        title: AppBarTitleView(
          "Cinema Detail",
          fontSize: TEXT_REGULAR_3X,
        ),
        leading: AppBarBackIconView(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "ic_star_fill.png".toAssetIcon(),
                width: MARGIN_LARGE,
                height: MARGIN_LARGE,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _CinemaFlickVideoView(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_MEDIUM_3,
              ),
              child: _CinemaDetailContentSection(),
            ),
            SizedBox(height: MARGIN_LARGE),
          ],
        ),
      ),
    );
  }
}

class _CinemaDetailContentSection extends StatelessWidget {
  const _CinemaDetailContentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "JCGV : Junction City",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: Text(
                "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: MARGIN_MEDIUM_2),
            SvgPicture.asset(
              "ic_navigate.svg".toAssetIcon(),
              color: PRIMARY_COLOR,
              height: MARGIN_LARGE,
              width: MARGIN_LARGE,
            )
          ],
        ),
        const SizedBox(height: MARGIN_XXLARGE),
        const Text(
          "Facilities",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        _CinemaServicesWrapView(),
        const SizedBox(height: MARGIN_XXLARGE),
        const Text(
          "Safety",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        _SafetyItemsWrapView()
      ],
    );
  }
}

class _SafetyItemsWrapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: MARGIN_10,
      spacing: MARGIN_10,
      children: [
        _SafetyItemView("Thermanal Scannig"),
        _SafetyItemView("Package Food "),
        _SafetyItemView("Security Check"),
        _SafetyItemView("Before Every Show"),
        _SafetyItemView("Disposable 3D glass"),
        _SafetyItemView("Contactless Food Service"),
        _SafetyItemView("Deep Cleaning of rest room"),
        _SafetyItemView("Thermanal Scannig"),
        _SafetyItemView("Package Food "),
        _SafetyItemView("Security Check"),
      ],
    );
  }
}

class _SafetyItemView extends StatelessWidget {
  final String text;

  _SafetyItemView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_LARGE,
        vertical: MARGIN_6,
      ),
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: TEXT_REGULAR,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CinemaServicesWrapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: MARGIN_10,
      spacing: MARGIN_10,
      children: [
        CinemaFacilityItemView(
          "Parking",
          "ic_parking.png".toAssetIcon(),
          fillColor: PRIMARY_COLOR,
        ),
        CinemaFacilityItemView(
          "Online Food",
          "ic_drink_food.png".toAssetIcon(),
          fillColor: PRIMARY_COLOR,
        ),
        CinemaFacilityItemView(
          "Wheek Chair",
          "ic_wheel_chair.png".toAssetIcon(),
          fillColor: PRIMARY_COLOR,
        ),
        CinemaFacilityItemView(
          "Ticket Cancellation",
          "ic_ticket_cancel.png".toAssetIcon(),
          fillColor: PRIMARY_COLOR,
        )
      ],
    );
  }
}

class _CinemaFlickVideoView extends StatefulWidget {
  const _CinemaFlickVideoView({
    Key? key,
  }) : super(key: key);

  @override
  State<_CinemaFlickVideoView> createState() => _CinemaFlickVideoViewState();
}

class _CinemaFlickVideoViewState extends State<_CinemaFlickVideoView> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    var videoController = VideoPlayerController.network(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    );
    flickManager = FlickManager(
      autoPlay: true,
      videoPlayerController: videoController,
    );
    // flickManager.flickVideoManager?.addListener(_videoPlayingListener);
  }

  _videoPlayingListener() async {
    if (flickManager.flickVideoManager?.isVideoInitialized ?? false) {
      flickManager.flickControlManager?.seekTo(const Duration(seconds: 10));
    }
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: const FlickVideoWithControls(
        closedCaptionTextStyle: TextStyle(fontSize: 8),
        controls: FlickPortraitControls(),
      ),
      flickVideoWithControlsFullscreen: const FlickVideoWithControls(
        controls: FlickLandscapeControls(),
      ),
    );
  }
}
