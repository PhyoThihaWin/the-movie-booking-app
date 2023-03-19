import 'package:moviebooking/data/model/movie_booking_model.dart';
import 'package:moviebooking/data/model/vos/actor_vo.dart';
import 'package:moviebooking/data/model/vos/banner_vo.dart';
import 'package:moviebooking/data/model/vos/city_vo.dart';
import 'package:moviebooking/data/model/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/model/vos/movie_vo.dart';
import 'package:moviebooking/data/model/vos/user_data_vo.dart';
import 'package:moviebooking/network/movie_booking_data_agent.dart';
import 'package:moviebooking/network/movie_booking_data_agent_impl.dart';
import 'package:moviebooking/persistence/daos/banner_dao.dart';
import 'package:moviebooking/persistence/daos/movie_dao.dart';
import 'package:moviebooking/utils/ext.dart';

class MovieBookingModelImpl extends MovieBookingModel {
  MovieBookingDataAgent movieBookingDataAgent = MovieBookingDataAgentImpl();

  MovieBookingModelImpl._internal();

  static final MovieBookingModelImpl _singleton =
      MovieBookingModelImpl._internal();

  factory MovieBookingModelImpl() => _singleton;

  BannerDao bannerDao = BannerDao();
  MovieDao movieDao = MovieDao();

  @override
  Future<String> getOTP(String phone) {
    return movieBookingDataAgent.getOTP(phone);
  }

  @override
  Future<UserDataVo?> signInWithPhone(String phone, String otpCode) {
    return movieBookingDataAgent.signInWithPhone(phone, otpCode);
  }

  @override
  Future<List<CityVo?>> getCities() {
    return movieBookingDataAgent.getCities();
  }

  @override
  Future<List<BannerVo?>> getBanners() {
    return movieBookingDataAgent.getBanners().then((value) async {
      bannerDao.saveAllBanners(value.orEmptyObject);
      return Future.value(value);
    });
  }

  @override
  Future<List<MovieVo?>> getMovies(String status) {
    return movieBookingDataAgent.getMovies(status).then((value) async {
      List<MovieVo?> list;
      if (status == "current") {
        list = value.map((e) {
          e?.isCurrent = true;
          e?.isComingSoon = false;
          return e;
        }).toList();
      } else {
        list = value.map((e) {
          e?.isCurrent = false;
          e?.isComingSoon = true;
          return e;
        }).toList();
      }
      movieDao.saveAllMovies(list.orEmptyObject);
      return Future.value(value);
    });
  }

  @override
  Future<MovieDetailVo> getMovieDetails(int movieId) {
    return movieBookingDataAgent.getMovieDetails(movieId);
  }

  @override
  Future<List<ActorVo>> getCreditsByMovie(int movieId) {
    return movieBookingDataAgent.getCreditsByMovie(movieId);
  }

  /// From Database

  @override
  Future<List<BannerVo?>> getBannersFromDb() {
    return Future.value(bannerDao.getAllBanner());
  }

  @override
  Future<List<MovieVo?>> getMoviesFromDb(String status) {
    return Future.value(movieDao.getMoviesByStatus(status));
  }
}
