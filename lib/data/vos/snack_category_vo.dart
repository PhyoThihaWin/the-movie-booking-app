import 'package:json_annotation/json_annotation.dart';

part 'snack_category_vo.g.dart';

@JsonSerializable()
class SnackCategoryVo {
  final int? id;
  final String? title;
  @JsonKey(name: 'title_mm')
  final String? titleMm;
  @JsonKey(name: 'is_active')
  final int? isActive;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;

  const SnackCategoryVo({
    this.id,
    this.title,
    this.titleMm,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SnackCategoryVo.fromJson(Map<String, dynamic> json) =>
      _$SnackCategoryVoFromJson(json);

  Map<String, dynamic> toJson() => _$SnackCategoryVoToJson(this);
}
