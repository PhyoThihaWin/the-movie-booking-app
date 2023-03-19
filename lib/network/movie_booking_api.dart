import 'package:dio/dio.dart';
import 'package:moviebooking/data/model/vos/banner_vo.dart';
import 'package:moviebooking/data/model/vos/city_vo.dart';
import 'package:moviebooking/data/model/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/model/vos/movie_vo.dart';
import 'package:moviebooking/data/model/vos/user_data_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/network/response/data_response.dart';
import 'package:moviebooking/network/response/get_credits_by_movie_response.dart';
import 'package:retrofit/http.dart';

part 'movie_booking_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class MovieBookingApi {
  factory MovieBookingApi(Dio dio) = _MovieBookingApi;

  @FormUrlEncoded()
  @POST(ENDPOINT_GET_OTP)
  Future<DataEmptyResponse> getOTP(
    @Field("phone") String phone,
  );

  @FormUrlEncoded()
  @POST(ENDPOINT_SIGN_IN_WITH_PHONE)
  Future<DataResponse<UserDataVo>> signInWithPhone(
    @Field("phone") String phone,
    @Field("otp") String otpCode,
  );

  @GET(ENDPOINT_GET_CITIES)
  Future<DataResponse<List<CityVo>>> getCities();

  @GET(ENDPOINT_GET_BANNERS)
  Future<DataResponse<List<BannerVo>>> getBanner();

  @GET(ENDPOINT_GET_MOVIES)
  Future<DataResponse<List<MovieVo>>> getMovies(
    @Query("status") String status,
  );

  @GET("https://api.themoviedb.org/3/movie/{movie_id}")
  Future<MovieDetailVo> getMovieDetails(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Path("movie_id") int movieId,
      );

  @GET("https://api.themoviedb.org/3/movie/{movie_id}/credits")
  Future<GetCreditsByMovieResponse> getCreditsByMovie(
      @Path("movie_id") int movieId,
      @Query(PARAM_API_KEY) String apiKey,
      );

}
