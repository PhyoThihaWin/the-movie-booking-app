import 'package:json_annotation/json_annotation.dart';

part 'cinema_show_time_vo.g.dart';

@JsonSerializable()
class CinemaShowTimeVo {
  @JsonKey(name: 'cinema_id')
  final int? cinemaId;
  final String? cinema;
  final List<Timeslots>? timeslots;

  const CinemaShowTimeVo({
    this.cinemaId,
    this.cinema,
    this.timeslots,
  });

  factory CinemaShowTimeVo.fromJson(Map<String, dynamic> json) =>
      _$CinemaShowTimeVoFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaShowTimeVoToJson(this);
}

@JsonSerializable()
class Timeslots {
  @JsonKey(name: 'cinema_day_timeslot_id')
  final int? cinemaDayTimeslotId;
  @JsonKey(name: 'start_time')
  final String? startTime;
  final int? status;

  const Timeslots({
    this.cinemaDayTimeslotId,
    this.startTime,
    this.status,
  });

  factory Timeslots.fromJson(Map<String, dynamic> json) =>
      _$TimeslotsFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotsToJson(this);
}
