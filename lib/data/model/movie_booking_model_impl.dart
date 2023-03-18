import 'package:moviebooking/data/model/movie_booking_model.dart';
import 'package:moviebooking/data/model/vos/city_vo.dart';
import 'package:moviebooking/data/model/vos/user_data_vo.dart';
import 'package:moviebooking/network/movie_booking_data_agent.dart';
import 'package:moviebooking/network/movie_booking_data_agent_impl.dart';

class MovieBookingModelImpl extends MovieBookingModel {
  MovieBookingDataAgent movieBookingDataAgent = MovieBookingDataAgentImpl();

  MovieBookingModelImpl._internal();

  static final MovieBookingModelImpl _singleton =
      MovieBookingModelImpl._internal();

  factory MovieBookingModelImpl() => _singleton;

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
}
