import 'package:dio/dio.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:moviebooking/data/model/vos/banner_vo.dart';
import 'package:moviebooking/data/model/vos/city_vo.dart';
import 'package:moviebooking/data/model/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/model/vos/movie_vo.dart';
import 'package:moviebooking/data/model/vos/user_data_vo.dart';
import 'package:moviebooking/network/movie_booking_data_agent.dart';
import 'package:moviebooking/utils/ext.dart';

import '../data/model/vos/actor_vo.dart';
import 'api_constants.dart';
import 'movie_booking_api.dart';

class MovieBookingDataAgentImpl extends MovieBookingDataAgent {
  late MovieBookingApi movieBookingApi;

  MovieBookingDataAgentImpl._internal() {
    final dio = Dio();
    movieBookingApi = MovieBookingApi(dio);
  }

  static final MovieBookingDataAgentImpl _singleton =
      MovieBookingDataAgentImpl._internal();

  factory MovieBookingDataAgentImpl() => _singleton;

  @override
  Future<String> getOTP(String phone) {
    return movieBookingApi
        .getOTP(phone)
        .asStream()
        .map((response) => response.message ?? "")
        .first;
  }

  @override
  Future<UserDataVo?> signInWithPhone(String phone, String otpCode) {
    return movieBookingApi
        .signInWithPhone(phone, otpCode)
        .asStream()
        .map((response) {
      response.data?.token = response.token.orEmpty;
      return response.data;
    }).first;
  }

  @override
  Future<List<CityVo?>> getCities() {
    return movieBookingApi
        .getCities()
        .asStream()
        .map((response) => response.data.orEmpty)
        .first;
  }

  @override
  Future<List<BannerVo?>> getBanners() {
    return movieBookingApi
        .getBanner()
        .asStream()
        .map((event) => event.data.orEmpty)
        .first;
  }

  @override
  Future<List<MovieVo?>> getMovies(String status) {
    return movieBookingApi
        .getMovies(status)
        .asStream()
        .map((event) => event.data.orEmpty)
        .first;
  }

  @override
  Future<MovieDetailVo> getMovieDetails(int movieId) {
    return movieBookingApi.getMovieDetails(API_KEY, LANGUAGE_ENUS, movieId);
  }

  @override
  Future<List<ActorVo>> getCreditsByMovie(int movieId) {
    return movieBookingApi
        .getCreditsByMovie(movieId, API_KEY)
        .asStream()
        .map(
            (getCreditsByMovieResponse) => getCreditsByMovieResponse.cast ?? [])
        .first;
  }
}
