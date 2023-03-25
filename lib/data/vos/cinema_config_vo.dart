import 'package:json_annotation/json_annotation.dart';

part 'cinema_config_vo.g.dart';

@JsonSerializable()
class CinemaConfigVo {
  final int? id;
  final String? key;
  final dynamic value;

  const CinemaConfigVo({
    this.id,
    this.key,
    this.value,
  });

  factory CinemaConfigVo.fromJson(Map<String, dynamic> json) =>
      _$CinemaConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaConfigVoToJson(this);
}
