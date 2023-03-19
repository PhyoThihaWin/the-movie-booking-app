import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

part 'banner_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_BANNER_VO, adapterName: "BannerVoAdapter")
class BannerVo {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? url;

  @JsonKey(name: 'is_active')
  @HiveField(3)
  final int? isActive;

  @JsonKey(name: 'created_at')
  @HiveField(4)
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  @HiveField(5)
  final String? updatedAt;

  const BannerVo({
    this.id,
    this.title,
    this.url,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerVo.fromJson(Map<String, dynamic> json) =>
      _$BannerVoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerVoToJson(this);
}
