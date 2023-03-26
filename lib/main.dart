import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviebooking/data/model/movie_booking_model_impl.dart';
import 'package:moviebooking/data/vos/banner_vo.dart';
import 'package:moviebooking/data/vos/genre_vo.dart';
import 'package:moviebooking/data/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/network/movie_booking_data_agent_impl.dart';
import 'package:moviebooking/page/auth/verify_phone_page.dart';
import 'package:moviebooking/page/home_page.dart';
import 'package:moviebooking/page/zoom_test.dart';
import 'package:moviebooking/persistence/hive_constants.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/utils/ext.dart';

import 'data/model/movie_booking_model.dart';
import 'data/vos/time_slot_config_vo.dart';
import 'data/vos/user_data_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataVoAdapter());
  Hive.registerAdapter(BannerVoAdapter());
  Hive.registerAdapter(MovieVoAdapter());
  Hive.registerAdapter(GenreVoAdapter());
  Hive.registerAdapter(MovieDetailVoAdapter());
  Hive.registerAdapter(TimeSlotConfigVoAdapter());

  await Hive.openBox<UserDataVo>(BOX_NAME_USER_DATA_VO);
  await Hive.openBox<BannerVo>(BOX_NAME_BANNER_VO);
  await Hive.openBox<MovieVo>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<MovieDetailVo>(BOX_NAME_MOVIE_DETAIL_VO);
  await Hive.openBox<TimeSlotConfigVo>(BOX_NAME_TIME_SLOT_CONFIG_VO);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final MovieBookingModel movieBookingModel = MovieBookingModelImpl();

  @override
  void initState() {
    movieBookingModel.getCinemaConfig().then((value) {
      var list = ((value[1]?.value as List<dynamic>?)
              ?.map((e) => TimeSlotConfigVo.fromJson(e as Map<String, dynamic>))
              .toList())
          .orEmptyObject;
      debugPrint("Timeslot length ==> ${list.length}");
      movieBookingModel.saveTimeSlotConfigsToDb(list);
    }).catchError((error) => debugPrint("Timeslot length ==> $error"));

    super.initState();
  }

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
      home: movieBookingModel.getUserDataFromDb() == null
          ? VerifyPhonePage()
          : HomePage(),
      // home: ZoomTestPage(),
    );
  }
}
