import 'package:flutter/material.dart';
import 'package:moviebooking/page/booking/booking_cinema_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';
import 'package:moviebooking/viewitem/sliver_app_bar_title.dart';
import 'package:moviebooking/widget/ripple_effect.dart';
import 'package:moviebooking/widget/title_text.dart';

import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../viewitem/actor_item_view.dart';
import '../../widget/booking_button_view.dart';

class MovieDetailPage extends StatelessWidget {
  final List<String> genreList = [
    "Action",
    "Drama",
    "Si",
    "Adventure",
    "Comedy"
  ];

  final bool isUpComing;

  MovieDetailPage(this.isUpComing);

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
                          child: MovieLandscapeVideoSection(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: MARGIN_MEDIUM_3,
                          left: MARGIN_MEDIUM_3,
                          child: MoviePortraitAndInfoViewSection(genreList),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_3,
                      right: MARGIN_MEDIUM_3,
                      top: MARGIN_MEDIUM_2,
                      bottom: MARGIN_XXLARGE,
                    ),
                    child: Column(
                      children: [
                        MovieDataViewSection(),
                        SizedBox(height: MARGIN_LARGE),
                        Visibility(
                          visible: this.isUpComing,
                          child: SetNotificationViewSection(),
                        ),
                        SizedBox(height: MARGIN_LARGE),
                        MovieStoryLineAndDescViewSection(),
                        SizedBox(height: MARGIN_XLARGE),
                        ActorListSection(),
                        SizedBox(height: MARGIN_XXLARGE * 2)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MARGIN_XXLARGE,
              left: 0,
              right: 0,
              child: Visibility(
                visible: !this.isUpComing,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    BookingButtonView(
                      btnText: "Booking",
                      btnClick: () {
                        context.next(BookingCinemaPage());
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
    return Stack(
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
            children: [
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
      padding: EdgeInsets.symmetric(
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
        children: [
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
  const ActorListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("Cast"),
        SizedBox(height: MARGIN_MEDIUM_2),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ActorItemView(),
          ),
        )
      ],
    );
  }
}

class MovieStoryLineAndDescViewSection extends StatelessWidget {
  const MovieStoryLineAndDescViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(MOVIE_STORY_LINE),
        SizedBox(height: MARGIN_MEDIUM_2),
        Text(
          "Story Line In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they oust their leader -- the legendary fighter Wild Knuckles. When the interview turns disastrous, Gru and his Minions go on the run with the Vicious 6 hot on their tails. Luckily, he finds an unlikely source for guidance -- Wild Knuckles himself -- and soon discovers that even bad guys need a little help from their friends.",
          style: TextStyle(
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
        SizedBox(width: MARGIN_MEDIUM),
        MovieDataCardView("Release Date", "May 8th, 2022"),
        SizedBox(width: MARGIN_MEDIUM),
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
        padding: EdgeInsets.symmetric(
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
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: MovieLandscapeImageView(),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black54,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM_2),
            child: RippleTap(
              onTap: () {
                context.popBack();
              },
              child: Icon(
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
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "ic_play_button.png".toAssetIcon(),
            scale: 3,
          ),
        )
      ],
    );
  }
}

class MovieLandscapeImageView extends StatelessWidget {
  const MovieLandscapeImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.thedirect.com/media/article_full/spider-man-no-way-home-poster-doc-ock.jpg",
      fit: BoxFit.cover,
    );
  }
}

class MoviePortraitAndInfoViewSection extends StatelessWidget {
  MoviePortraitAndInfoViewSection(this.genreList);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const MoviePortraitImageView(),
        const SizedBox(width: MARGIN_MEDIUM_2),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieTitleAndImdbView(),
              const SizedBox(height: MARGIN_MEDIUM),
              const Text(
                "2D, 3D, 3D IMAX, 3D DBOX",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: MARGIN_MEDIUM),
              Wrap(
                runSpacing: -MARGIN_MEDIUM,
                spacing: MARGIN_MEDIUM,
                children:
                    genreList.map((genre) => GenreChipView(genre)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MoviePortraitImageView extends StatelessWidget {
  const MoviePortraitImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/18db74131665207.619a758319dcd.jpg",
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
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MovieTitleAndImdbView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Moana II",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: MARGIN_MEDIUM_2),
        Image.asset(
          "imdb_logo.png".toAssetImage(),
          height: MARGIN_XLARGE,
        ),
        const SizedBox(width: 2),
        const Text(
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
