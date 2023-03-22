// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trailer_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrailerVideoResponse _$GetTrailerVideoResponseFromJson(
        Map<String, dynamic> json) =>
    GetTrailerVideoResponse(
      json['id'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => TrailerVideoVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTrailerVideoResponseToJson(
        GetTrailerVideoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
