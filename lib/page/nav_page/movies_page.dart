import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/page/movie_detail_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../resource/dimens.dart';
import '../../resource/strings.dart';
import '../../widget/movie_card_item_view.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CarouselSliderViewSection(),
                  NowAndComingTabViewSection(
                    (index) => setState(() {
                      _tabIndex = index;
                    }),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3,
                vertical: MARGIN_MEDIUM,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: MARGIN_MEDIUM_3 / 2),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return MovieCardItemView(_tabIndex, () {
                    context.next(MovieDetailPage());
                  });
                }, childCount: 10),
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
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_3,
        vertical: MARGIN_MEDIUM_2,
      ),
      padding: EdgeInsets.all(MARGIN_6),
      decoration: BoxDecoration(
          color: SEARCH_BOX_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
      child: TabBar(
        controller: _tabController,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: TEXT_REGULAR,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: TEXT_GREY_COLOR,
        indicator: BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_SMALL)),
        tabs: [
          Tab(
            text: MOVIE_NOW_SHOWING,
          ),
          Tab(
            text: MOVIE_COMING_SOON,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderViewSection extends StatefulWidget {
  const CarouselSliderViewSection({Key? key}) : super(key: key);

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
            items: [
              ClipRRect(
                borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
                child: Image.network(
                  "https://www.newcanaanymca.org/wp-content/uploads/2021/11/Moana-Movie-Poster-landscape.jpg",
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
                child: Image.network(
                  "https://s.yimg.com/ny/api/res/1.2/IZa_5rVom.ExKWD6zBAEew--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzY-/https://media.zenfs.com/en/vibe_128/ae6003a55d6a40fd6df4b45f079b9cde",
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
                child: Image.network(
                  "https://www.vitalthrills.com/wp-content/uploads/2021/07/duning5.jpg.webp",
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              )
            ]),
        SizedBox(height: MARGIN_SMALL),
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
      decorator: DotsDecorator(
          color: TEXT_GREY_COLOR,
          activeColor: PRIMARY_COLOR,
          size: Size(MARGIN_6, MARGIN_6),
          activeSize: Size(MARGIN_MEDIUM, MARGIN_MEDIUM)),
    );
  }
}
