// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seating_plan_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatingPlanVo _$SeatingPlanVoFromJson(Map<String, dynamic> json) =>
    SeatingPlanVo(
      id: json['id'] as int?,
      type: json['type'] as String?,
      seatName: json['seat_name'] as String?,
      symbol: json['symbol'] as String?,
      price: json['price'] as int?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$SeatingPlanVoToJson(SeatingPlanVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'seat_name': instance.seatName,
      'symbol': instance.symbol,
      'price': instance.price,
      'isSelected': instance.isSelected,
    };
