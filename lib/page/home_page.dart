import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviebooking/page/cinema/cinema_page.dart';
import 'package:moviebooking/page/movies/movies_page.dart';
import 'package:moviebooking/page/profile/profile_page.dart';
import 'package:moviebooking/page/ticket/ticket_page.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/strings.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final _pageBody = const <Widget>[
    MoviesPage(),
    CinemaPage(),
    TicketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const AppBarCityTitleView(),
        actions: appBarActionIconList(),
      ),
      body: _pageBody[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: TEXT_GREY_COLOR,
        selectedItemColor: PRIMARY_COLOR,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: bottomNavigationMenuItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationMenuItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("ic_movie.png".toAssetIcon()),
          size: MARGIN_LARGE,
        ),
        label: MENU_MOVIE_TEXT,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("ic_cinema.png".toAssetIcon()),
          size: MARGIN_LARGE,
        ),
        label: MENU_CINEMA_TEXT,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("ic_ticket.png".toAssetIcon()),
          size: MARGIN_LARGE,
        ),
        label: MENU_TICKET_TEXT,
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("ic_profile.png".toAssetIcon()),
          size: MARGIN_LARGE,
        ),
        label: MENU_PROFILE_TEXT,
      ),
    ];
  }

  List<Widget> appBarActionIconList() {
    return const [
      Padding(
        padding: EdgeInsets.all(
          MARGIN_CARD_MEDIUM_2,
        ),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(
          MARGIN_CARD_MEDIUM_2,
        ),
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: MARGIN_CARD_MEDIUM_2,
          right: MARGIN_MEDIUM_3,
        ),
        child: Icon(
          Icons.qr_code_scanner,
          color: Colors.white,
        ),
      )
    ];
  }
}

class AppBarCityTitleView extends StatelessWidget {
  const AppBarCityTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MARGIN_MEDIUM_2),
        SvgPicture.asset(
          "ic_navigate.svg".toAssetIcon(),
          color: Colors.white,
          width: MARGIN_MEDIUM_3,
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "Yangon",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_3X,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
