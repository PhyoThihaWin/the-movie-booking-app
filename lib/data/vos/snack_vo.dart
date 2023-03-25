import 'package:json_annotation/json_annotation.dart';

part 'snack_vo.g.dart';

@JsonSerializable()
class SnackVo {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final String? image;

  @JsonKey(includeFromJson: false)
  int qty;

  SnackVo(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.qty = 0});

  factory SnackVo.fromJson(Map<String, dynamic> json) =>
      _$SnackVoFromJson(json);

  Map<String, dynamic> toJson() => _$SnackVoToJson(this);
}
