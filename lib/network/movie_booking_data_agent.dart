import 'package:moviebooking/data/model/vos/banner_vo.dart';
import 'package:moviebooking/data/model/vos/city_vo.dart';
import 'package:moviebooking/data/model/vos/movie_vo.dart';
import 'package:moviebooking/data/model/vos/user_data_vo.dart';

import '../data/model/vos/actor_vo.dart';
import '../data/model/vos/movie_detail_vo.dart';

abstract class MovieBookingDataAgent {
  Future<String> getOTP(String phone);

  Future<UserDataVo?> signInWithPhone(String phone, String otpCode);

  Future<List<CityVo?>> getCities();

  Future<List<BannerVo?>> getBanners();

  Future<List<MovieVo?>> getMovies(String status);

  Future<MovieDetailVo> getMovieDetails(int movieId);

  Future<List<ActorVo>> getCreditsByMovie(int movieId);
}
