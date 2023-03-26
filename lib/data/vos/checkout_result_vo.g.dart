// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_result_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResultVo _$CheckoutResultVoFromJson(Map<String, dynamic> json) =>
    CheckoutResultVo(
      id: json['id'] as int?,
      bookingNo: json['booking_no'] as String?,
      bookingDate: json['booking_date'] as String?,
      row: json['row'] as String?,
      seat: json['seat'] as String?,
      totalSeat: json['total_seat'] as int?,
      total: json['total'] as String?,
      movieId: json['movie_id'] as int?,
      cinemaId: json['cinema_id'] as int?,
      username: json['username'],
      timeslot: json['timeslot'] == null
          ? null
          : Timeslot.fromJson(json['timeslot'] as Map<String, dynamic>),
      qrCode: json['qr_code'] as String?,
    );

Map<String, dynamic> _$CheckoutResultVoToJson(CheckoutResultVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_no': instance.bookingNo,
      'booking_date': instance.bookingDate,
      'row': instance.row,
      'seat': instance.seat,
      'total_seat': instance.totalSeat,
      'total': instance.total,
      'movie_id': instance.movieId,
      'cinema_id': instance.cinemaId,
      'username': instance.username,
      'timeslot': instance.timeslot,
      'qr_code': instance.qrCode,
    };

Timeslot _$TimeslotFromJson(Map<String, dynamic> json) => Timeslot(
      cinemaDayTimeslotId: json['cinema_day_timeslot_id'] as int?,
      startTime: json['start_time'] as String?,
    );

Map<String, dynamic> _$TimeslotToJson(Timeslot instance) => <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
    };
