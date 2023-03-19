// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVoAdapter extends TypeAdapter<MovieVo> {
  @override
  final int typeId = 3;

  @override
  MovieVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVo(
      id: fields[0] as int?,
      originalTitle: fields[1] as String?,
      releaseDate: fields[2] as String?,
      genres: (fields[3] as List?)?.cast<String>(),
      posterPath: fields[4] as String?,
      isCurrent: fields[5] as bool?,
      isComingSoon: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originalTitle)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.isCurrent)
      ..writeByte(6)
      ..write(obj.isComingSoon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVo _$MovieVoFromJson(Map<String, dynamic> json) => MovieVo(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      releaseDate: json['release_date'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      posterPath: json['poster_path'] as String?,
      isCurrent: json['isCurrent'] as bool?,
      isComingSoon: json['isComingSoon'] as bool?,
    );

Map<String, dynamic> _$MovieVoToJson(MovieVo instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'poster_path': instance.posterPath,
      'isCurrent': instance.isCurrent,
      'isComingSoon': instance.isComingSoon,
    };
