import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_MOVIE_VO, adapterName: "MovieVoAdapter")
class MovieVo {
  @HiveField(0)
  final int? id;

  @JsonKey(name: 'original_title')
  @HiveField(1)
  final String? originalTitle;

  @JsonKey(name: 'release_date')
  @HiveField(2)
  final String? releaseDate;

  @HiveField(3)
  final List<String>? genres;

  @JsonKey(name: 'poster_path')
  @HiveField(4)
  final String? posterPath;

  @HiveField(5)
  bool? isCurrent;

  @HiveField(6)
  bool? isComingSoon;

  MovieVo(
      {this.id,
      this.originalTitle,
      this.releaseDate,
      this.genres,
      this.posterPath,
      this.isCurrent,
      this.isComingSoon});

  factory MovieVo.fromJson(Map<String, dynamic> json) =>
      _$MovieVoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVoToJson(this);
}
