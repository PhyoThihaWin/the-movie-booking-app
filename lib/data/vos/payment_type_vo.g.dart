// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTypeVo _$PaymentTypeVoFromJson(Map<String, dynamic> json) =>
    PaymentTypeVo(
      id: json['id'] as int?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$PaymentTypeVoToJson(PaymentTypeVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
