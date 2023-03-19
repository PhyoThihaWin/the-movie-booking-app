import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GENRE_VO, adapterName: "GenreVoAdapter")
class GenreVo {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  GenreVo(this.id, this.name);

  factory GenreVo.fromJson(Map<String, dynamic> json) =>
      _$GenreVoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVoToJson(this);
}