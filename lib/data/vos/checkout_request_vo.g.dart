// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequestVo _$CheckoutRequestVoFromJson(Map<String, dynamic> json) =>
    CheckoutRequestVo(
      cinemaDayTimeslotId: json['cinema_day_timeslot_id'] as int?,
      seatNumber: json['seat_number'] as String?,
      bookingDate: json['booking_date'] as String?,
      movieId: json['movie_id'] as int?,
      paymentTypeId: json['payment_type_id'] as int?,
      snacks: (json['snacks'] as List<dynamic>?)
          ?.map((e) => Snacks.fromJson(e as Map<String, dynamic>))
          .toList(),
      movieName: json['movieName'] as String?,
    )
      ..cinemaTimeSlot = json['cinemaTimeSlot'] == null
          ? null
          : CinemaShowTimeVo.fromJson(
              json['cinemaTimeSlot'] as Map<String, dynamic>)
      ..ticketCount = json['ticketCount'] as int?
      ..ticketPrice = json['ticketPrice'] as int?
      ..snackCartList = (json['snackCartList'] as List<dynamic>?)
          ?.map((e) => SnackVo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CheckoutRequestVoToJson(CheckoutRequestVo instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'seat_number': instance.seatNumber,
      'booking_date': instance.bookingDate,
      'movie_id': instance.movieId,
      'payment_type_id': instance.paymentTypeId,
      'snacks': instance.snacks,
    };

Snacks _$SnacksFromJson(Map<String, dynamic> json) => Snacks(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$SnacksToJson(Snacks instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
    };
