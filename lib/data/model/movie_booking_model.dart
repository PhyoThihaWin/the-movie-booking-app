import 'package:moviebooking/data/vos/actor_vo.dart';
import 'package:moviebooking/data/vos/banner_vo.dart';
import 'package:moviebooking/data/vos/city_vo.dart';
import 'package:moviebooking/data/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';

abstract class MovieBookingModel {
  /// Network
  Future<String> getOTP(String phone);

  Future<UserDataVo?> signInWithPhone(String phone, String otpCode);

  Future<List<CityVo?>> getCities();

  Future<List<BannerVo?>> getBanners();

  Future<List<MovieVo?>> getMovies(String status);

  Future<MovieDetailVo> getMovieDetails(int movieId);

  Future<List<ActorVo>> getCreditsByMovie(int movieId);

  /// Database
  Future<List<BannerVo?>> getBannersFromDb();

  Future<List<MovieVo?>> getMoviesFromDb(String status);

  Future<MovieDetailVo?> getMovieDetailFromDb(int movieId);
}
