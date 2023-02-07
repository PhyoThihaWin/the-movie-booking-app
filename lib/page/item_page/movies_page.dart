import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';

import '../../resource/dimens.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HOME_SCREEN_BACKGROUND_COLOR,
      child: Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 4,
                viewportFraction: 0.85,
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
                Image.network(
                  "https://fictionhorizon.com/wp-content/uploads/2021/09/Wolverine-Movies-in-Order-All-X-Logan-Movies-Order-09.jpg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://fictionhorizon.com/wp-content/uploads/2021/09/Wolverine-Movies-in-Order-All-X-Logan-Movies-Order-09.jpg",
                  fit: BoxFit.cover,
                ),
                Image.network(
                  "https://fictionhorizon.com/wp-content/uploads/2021/09/Wolverine-Movies-in-Order-All-X-Logan-Movies-Order-09.jpg",
                  fit: BoxFit.cover,
                )
              ]),
          SizedBox(height: MARGIN_SMALL),
          DotsIndicator(
            dotsCount: 3,
            position: _position,
            decorator: DotsDecorator(
              color: TEXT_GREY_COLOR,
              activeColor: PRIMARY_COLOR,
            ),
          )
        ],
      ),
    );
  }
}
