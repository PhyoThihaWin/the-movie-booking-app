import 'package:moviebooking/data/vos/banner_vo.dart';
import 'package:moviebooking/data/vos/cinema_config_vo.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/data/vos/city_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/data/vos/seating_plan_vo.dart';
import 'package:moviebooking/data/vos/trailer_video_vo.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';

import '../data/vos/actor_vo.dart';
import '../data/vos/movie_detail_vo.dart';

abstract class MovieBookingDataAgent {
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
}
