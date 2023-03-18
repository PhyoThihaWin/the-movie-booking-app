// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataVo _$UserDataVoFromJson(Map<String, dynamic> json) => UserDataVo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      totalExpense: json['total_expense'] as int?,
      profileImage: json['profile_image'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserDataVoToJson(UserDataVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'total_expense': instance.totalExpense,
      'profile_image': instance.profileImage,
      'token': instance.token,
    };
