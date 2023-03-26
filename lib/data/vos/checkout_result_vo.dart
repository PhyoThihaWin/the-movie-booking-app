import 'package:json_annotation/json_annotation.dart';

part 'checkout_result_vo.g.dart';

@JsonSerializable()
class CheckoutResultVo {
  final int? id;
  @JsonKey(name: 'booking_no')
  final String? bookingNo;
  @JsonKey(name: 'booking_date')
  final String? bookingDate;
  final String? row;
  final String? seat;
  @JsonKey(name: 'total_seat')
  final int? totalSeat;
  final String? total;
  @JsonKey(name: 'movie_id')
  final int? movieId;
  @JsonKey(name: 'cinema_id')
  final int? cinemaId;
  final dynamic username;
  final Timeslot? timeslot;
  @JsonKey(name: 'qr_code')
  final String? qrCode;

  const CheckoutResultVo({
    this.id,
    this.bookingNo,
    this.bookingDate,
    this.row,
    this.seat,
    this.totalSeat,
    this.total,
    this.movieId,
    this.cinemaId,
    this.username,
    this.timeslot,
    this.qrCode,
  });

  factory CheckoutResultVo.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResultVoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResultVoToJson(this);
}

@JsonSerializable()
class Timeslot {
  @JsonKey(name: 'cinema_day_timeslot_id')
  final int? cinemaDayTimeslotId;
  @JsonKey(name: 'start_time')
  final String? startTime;

  const Timeslot({
    this.cinemaDayTimeslotId,
    this.startTime,
  });

  factory Timeslot.fromJson(Map<String, dynamic> json) =>
      _$TimeslotFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotToJson(this);
}
