// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackVo _$SnackVoFromJson(Map<String, dynamic> json) => SnackVo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      categoryId: json['category_id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SnackVoToJson(SnackVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'image': instance.image,
    };
