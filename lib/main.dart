import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviebooking/data/model/vos/banner_vo.dart';
import 'package:moviebooking/data/model/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/model/vos/movie_vo.dart';
import 'package:moviebooking/page/auth/verify_phone_page.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/persistence/hive_constants.dart';
import 'package:moviebooking/resource/colors.dart';

import 'data/model/vos/user_data_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataVoAdapter());
  Hive.registerAdapter(BannerVoAdapter());
  Hive.registerAdapter(MovieVoAdapter());
  Hive.registerAdapter(MovieDetailVoAdapter());

  await Hive.openBox<UserDataVo>(BOX_NAME_USER_DATA_VO);
  await Hive.openBox<BannerVo>(BOX_NAME_BANNER_VO);
  await Hive.openBox<MovieVo>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<MovieDetailVo>(BOX_NAME_MOVIE_DETAIL_VO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        primaryColor: PRIMARY_COLOR,
        primarySwatch: PRIMARY_COLOR_MATERIAL,
      ),
      home: VerifyPhonePage(),
    );
  }
}
