import 'package:json_annotation/json_annotation.dart';

part 'city_vo.g.dart';

@JsonSerializable()
class CityVo {
  final int? id;
  final String? name;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const CityVo({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CityVo.fromJson(Map<String, dynamic> json) =>
      _$CityVoFromJson(json);

  Map<String, dynamic> toJson() => _$CityVoToJson(this);
}
