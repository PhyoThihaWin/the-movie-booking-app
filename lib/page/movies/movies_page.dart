import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/page/movies/movie_detail_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/app_constants.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../data/model/movie_booking_model.dart';
import '../../data/model/movie_booking_model_impl.dart';
import '../../data/vos/banner_vo.dart';
import '../../data/vos/movie_vo.dart';
import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../viewitem/movie_card_item_view.dart';

class MoviesPage extends StatefulWidget {
  final Function(int) onTabChanged;

  MoviesPage(this.onTabChanged);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<BannerVo?>? bannerList;
  List<MovieVo>? movieList;

  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  @override
  void initState() {
    /// Banner
    movieBookingModel.getBanners().then((list) {
      setState(() {
        bannerList = list;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Banner From Db
    movieBookingModel.getBannersFromDb().then((list) {
      setState(() {
        bannerList = list;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    getMovieByStatus(PARAM_MOVIE_CURRENT);

    super.initState();
  }

  void getMovieByStatus(String status) {
    /// Movie
    movieBookingModel.getMovies(status).then((list) {
      setState(() {
        movieList = list.orEmptyObject;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    /// Movie From Db
    movieBookingModel.getMoviesFromDb(status).then((list) {
      setState(() {
        movieList = list.orEmptyObject;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CarouselSliderViewSection(bannerList.orEmptyObject),
                  NowAndComingTabViewSection(
                    (index) => setState(() {
                      widget.onTabChanged(index);
                      getMovieByStatus(index == 0
                          ? PARAM_MOVIE_CURRENT
                          : PARAM_MOVIE_COMING_SOON);
                    }),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_MEDIUM,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: MARGIN_MEDIUM_3 / 2),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return MovieCardItemView(
                      movie: movieList![index],
                      onClickItem: (isUpComing) {
                        context.next(MovieDetailPage(
                          movieId: movieList![index].id.orZero,
                          isUpComing: isUpComing,
                        ));
                      });
                }, childCount: movieList.orEmpty.length),
              ),
            ),
          ],
        ));
  }
}

class NowAndComingTabViewSection extends StatefulWidget {
  final Function(int index) onTabChange;

  NowAndComingTabViewSection(this.onTabChange);

  @override
  State<NowAndComingTabViewSection> createState() =>
      _NowAndComingTabViewSectionState();
}

class _NowAndComingTabViewSectionState extends State<NowAndComingTabViewSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      widget.onTabChange(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
        vertical: MARGIN_MEDIUM_2,
      ),
      padding: const EdgeInsets.all(MARGIN_6),
      decoration: BoxDecoration(
          color: SEARCH_BOX_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
      child: TabBar(
        controller: _tabController,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: TEXT_REGULAR,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: TEXT_GREY_COLOR,
        indicator: BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_SMALL)),
        tabs: [
          const Tab(
            text: MOVIE_NOW_SHOWING,
          ),
          const Tab(
            text: MOVIE_COMING_SOON,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderViewSection extends StatefulWidget {
  final List<BannerVo> bannerList;

  CarouselSliderViewSection(this.bannerList);

  @override
  State<CarouselSliderViewSection> createState() =>
      _CarouselSliderViewSectionState();
}

class _CarouselSliderViewSectionState extends State<CarouselSliderViewSection> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4.5,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                _position = index.toDouble();
              });
            },
          ),
          items: widget.bannerList
              .map(
                (banner) => ClipRRect(
                  borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
                  child: Image.network(
                    banner.url.orEmpty,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: MARGIN_SMALL),
        DotsIndicatorView(position: _position)
      ],
    );
  }
}

class DotsIndicatorView extends StatelessWidget {
  const DotsIndicatorView({
    Key? key,
    required double position,
  })  : _position = position,
        super(key: key);

  final double _position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _position,
      decorator: const DotsDecorator(
          color: TEXT_GREY_COLOR,
          activeColor: PRIMARY_COLOR,
          size: Size(MARGIN_6, MARGIN_6),
          activeSize: Size(MARGIN_MEDIUM, MARGIN_MEDIUM)),
    );
  }
}
