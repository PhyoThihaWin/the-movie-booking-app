import 'dart:ffi';

import 'package:moviebooking/data/vos/actor_vo.dart';
import 'package:moviebooking/data/vos/banner_vo.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/data/vos/city_vo.dart';
import 'package:moviebooking/data/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/data/vos/time_slot_config_vo.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';

import '../vos/cinema_config_vo.dart';
import '../vos/seating_plan_vo.dart';
import '../vos/trailer_video_vo.dart';

abstract class MovieBookingModel {
  /// Network
  Future<String> getOTP(String phone);

  Future<UserDataVo?> signInWithPhone(String phone, String otpCode);

  Future<List<CityVo?>> getCities();

  Future<List<BannerVo?>> getBanners();

  Future<List<MovieVo?>> getMovies(String status);

  Future<List<CinemaConfigVo?>> getCinemaConfig();

  Future<MovieDetailVo> getMovieDetails(int movieId);

  Future<TrailerVideoVo?> getTrailerVideo(int movieId);

  Future<List<ActorVo>> getCreditsByMovie(int movieId);

  Future<List<CinemaShowTimeVo?>> getCinemaShowTimeByDate(String date);

  Future<List<List<SeatingPlanVo>?>> getSeatingPlanByShowTime(
      int cinemaTimeSlotId, String bookingDate);

  /// Database
  Future<List<BannerVo?>> getBannersFromDb();

  Future<List<MovieVo?>> getMoviesFromDb(String status);

  Future<MovieDetailVo?> getMovieDetailFromDb(int movieId);

  void saveUserDataToDb(UserDataVo userData);

  UserDataVo? getUserDataFromDb();

  void saveTimeSlotConfigsToDb(List<TimeSlotConfigVo> list);

  TimeSlotConfigVo? getTimeSlotConfigFromDb(int id);
}
