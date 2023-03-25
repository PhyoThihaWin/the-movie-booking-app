import 'package:dio/dio.dart';
import 'package:moviebooking/data/vos/banner_vo.dart';
import 'package:moviebooking/data/vos/cinema_config_vo.dart';
import 'package:moviebooking/data/vos/cinema_show_time_vo.dart';
import 'package:moviebooking/data/vos/city_vo.dart';
import 'package:moviebooking/data/vos/movie_detail_vo.dart';
import 'package:moviebooking/data/vos/movie_vo.dart';
import 'package:moviebooking/data/vos/seating_plan_vo.dart';
import 'package:moviebooking/data/vos/snack_category_vo.dart';
import 'package:moviebooking/data/vos/snack_vo.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';
import 'package:moviebooking/network/api_constants.dart';
import 'package:moviebooking/network/response/data_response.dart';
import 'package:moviebooking/network/response/get_credits_by_movie_response.dart';
import 'package:moviebooking/network/response/get_trailer_video_response.dart';
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

  @GET(ENDPOINT_GET_CINEMA_CONFIG)
  Future<DataResponse<List<CinemaConfigVo>>> getCinemaConfig();

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

  @GET("https://api.themoviedb.org/3/movie/{movie_id}/videos")
  Future<GetTrailerVideoResponse> getTrailerVideo(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Path("movie_id") int movieId,
  );

  @GET(ENDPOINT_GET_CINEMA_SHOW_TIME)
  Future<DataResponse<List<CinemaShowTimeVo>>> getCinemaShowTimeByDate(
    @Query(PARAM_DATE) String date,
  );

  @GET(ENDPOINT_GET_SEATING_PLAN_BY_SHOW_TIME)
  Future<DataResponse<List<List<SeatingPlanVo>>>> getSeatingPlanByShowTime(
    @Query(PARAM_CINEMA_DAY_TIME_SLOT_ID) int date,
    @Query(PARAM_BOOKING_DATE) String bookingDate,
  );

  @GET(ENDPOINT_GET_SNACK_CATEGORYS)
  Future<DataResponse<List<SnackCategoryVo>>> getSnackCategories();

  @GET(ENDPOINT_GET_SNACK_BY_CATEGORYS)
  Future<DataResponse<List<SnackVo>>> getSnacksByCategory(
      @Query(PARAM_CATEGORY_ID) int categoryId);
}

// (json) => (json as List<dynamic>)
//     .map<List<SeatingPlanVo>>((i) => (i as List<dynamic>)
//     .map<SeatingPlanVo>(
// (j) => SeatingPlanVo.fromJson(j as Map<String, dynamic>))
//     .toList())
// .toList(),
