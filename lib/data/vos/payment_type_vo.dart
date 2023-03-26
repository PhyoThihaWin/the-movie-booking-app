import 'package:json_annotation/json_annotation.dart';

part 'payment_type_vo.g.dart';

@JsonSerializable()
class PaymentTypeVo {
  final int? id;
  final String? title;
  final String? icon;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;

  const PaymentTypeVo({
    this.id,
    this.title,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PaymentTypeVo.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeVoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeVoToJson(this);
}
