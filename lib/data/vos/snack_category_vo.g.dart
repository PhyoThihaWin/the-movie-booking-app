// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryVo _$SnackCategoryVoFromJson(Map<String, dynamic> json) =>
    SnackCategoryVo(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleMm: json['title_mm'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$SnackCategoryVoToJson(SnackCategoryVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_mm': instance.titleMm,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
