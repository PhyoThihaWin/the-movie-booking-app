import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

part 'time_slot_config_vo.g.dart';

@JsonSerializable()
@HiveType(
  typeId: HIVE_TYPE_ID_TIME_SLOT_CONFIG_VO,
  adapterName: "TimeSlotConfigVoAdapter",
)
class TimeSlotConfigVo {
  @HiveField(1)
  final int? id;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? color;

  const TimeSlotConfigVo({
    this.id,
    this.title,
    this.color,
  });

  factory TimeSlotConfigVo.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotConfigVoToJson(this);
}
