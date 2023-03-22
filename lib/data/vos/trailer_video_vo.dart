import 'package:json_annotation/json_annotation.dart';

part 'trailer_video_vo.g.dart';

@JsonSerializable()
class TrailerVideoVo {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? id;

  const TrailerVideoVo({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory TrailerVideoVo.fromJson(Map<String, dynamic> json) =>
      _$TrailerVideoVoFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerVideoVoToJson(this);
}
