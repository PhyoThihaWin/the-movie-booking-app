import 'package:dart_extensions/dart_extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/data/vos/snack_vo.dart';

import 'cinema_show_time_vo.dart';

part 'checkout_request_vo.g.dart';

@JsonSerializable()
class CheckoutRequestVo {
  @JsonKey(name: 'cinema_day_timeslot_id')
  int? cinemaDayTimeslotId;
  @JsonKey(name: 'seat_number')
  String? seatNumber;
  @JsonKey(name: 'booking_date')
  String? bookingDate;
  @JsonKey(name: 'movie_id')
  int? movieId;
  @JsonKey(name: 'payment_type_id')
  int? paymentTypeId;
  List<Snacks>? snacks;

  /// ignore field!!
  @JsonKey(includeToJson: false)
  String? movieName;

  @JsonKey(includeToJson: false)
  CinemaShowTimeVo? cinemaTimeSlot;

  @JsonKey(includeToJson: false)
  int? ticketCount;

  @JsonKey(includeToJson: false)
  int? ticketPrice;

  @JsonKey(includeToJson: false)
  List<SnackVo>? snackCartList;

  CheckoutRequestVo({
    this.cinemaDayTimeslotId,
    this.seatNumber,
    this.bookingDate,
    this.movieId,
    this.paymentTypeId,
    this.snacks,
    this.movieName,
  });

  factory CheckoutRequestVo.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestVoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestVoToJson(this);

  /// custom function

  String? getTimeSlotTime() {
    return (cinemaTimeSlot?.timeslots
        ?.where((element) => element.cinemaDayTimeslotId == cinemaDayTimeslotId)
        .firstOrNull
        ?.startTime);
  }
}

@JsonSerializable()
class Snacks {
  final int? id;
  final int? quantity;

  const Snacks({
    this.id,
    this.quantity,
  });

  factory Snacks.fromJson(Map<String, dynamic> json) => _$SnacksFromJson(json);

  Map<String, dynamic> toJson() => _$SnacksToJson(this);
}
