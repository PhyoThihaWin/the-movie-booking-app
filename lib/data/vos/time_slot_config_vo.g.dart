// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_config_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSlotConfigVoAdapter extends TypeAdapter<TimeSlotConfigVo> {
  @override
  final int typeId = 7;

  @override
  TimeSlotConfigVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSlotConfigVo(
      id: fields[1] as int?,
      title: fields[2] as String?,
      color: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeSlotConfigVo obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlotConfigVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotConfigVo _$TimeSlotConfigVoFromJson(Map<String, dynamic> json) =>
    TimeSlotConfigVo(
      id: json['id'] as int?,
      title: json['title'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$TimeSlotConfigVoToJson(TimeSlotConfigVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
    };
