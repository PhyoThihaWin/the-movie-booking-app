import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';
import 'movie_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ACTOR_VO, adapterName: "ActorVoAdapter")
class ActorVo {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "id")
  @HiveField(1)
  int? id;

  @JsonKey(name: "known_for")
  @HiveField(2)
  List<MovieVo>? knownFor;

  @JsonKey(name: "popularity")
  @HiveField(3)
  double? popularity;

  @JsonKey(name: "name")
  @HiveField(4)
  String? name;

  @JsonKey(name: "profile_path")
  @HiveField(5)
  String? profilePath;

  @JsonKey(name: "known_for_department")
  @HiveField(6)
  String? knownForDepartment;

  @JsonKey(name: "original_name")
  @HiveField(7)
  String? originalName;

  @JsonKey(name: "cast_id")
  @HiveField(8)
  int? castId;

  @JsonKey(name: "character")
  @HiveField(9)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(10)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(11)
  int? order;

  ActorVo(
      this.adult,
      this.id,
      this.knownFor,
      this.popularity,
      this.name,
      this.profilePath,
      this.knownForDepartment,
      this.originalName,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory ActorVo.fromJson(Map<String, dynamic> json) =>
      _$ActorVoFromJson(json);

  Map<String, dynamic> toJson() => _$ActorVoToJson(this);
}
