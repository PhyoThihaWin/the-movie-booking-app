import 'package:json_annotation/json_annotation.dart';

part 'seating_plan_vo.g.dart';

@JsonSerializable()
class SeatingPlanVo {
  final int? id;
  final String? type;
  @JsonKey(name: 'seat_name')
  final String? seatName;
  final String? symbol;
  final int? price;

  bool? isSelected;

  SeatingPlanVo(
      {this.id,
      this.type,
      this.seatName,
      this.symbol,
      this.price,
      this.isSelected});

  factory SeatingPlanVo.fromJson(Map<String, dynamic> json) =>
      _$SeatingPlanVoFromJson(json);

  Map<String, dynamic> toJson() => _$SeatingPlanVoToJson(this);
}
