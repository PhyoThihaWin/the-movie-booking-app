// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_show_time_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaShowTimeVo _$CinemaShowTimeVoFromJson(Map<String, dynamic> json) =>
    CinemaShowTimeVo(
      cinemaId: json['cinema_id'] as int?,
      cinema: json['cinema'] as String?,
      timeslots: (json['timeslots'] as List<dynamic>?)
          ?.map((e) => Timeslots.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CinemaShowTimeVoToJson(CinemaShowTimeVo instance) =>
    <String, dynamic>{
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeslots,
    };

Timeslots _$TimeslotsFromJson(Map<String, dynamic> json) => Timeslots(
      cinemaDayTimeslotId: json['cinema_day_timeslot_id'] as int?,
      startTime: json['start_time'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TimeslotsToJson(Timeslots instance) => <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'status': instance.status,
    };
