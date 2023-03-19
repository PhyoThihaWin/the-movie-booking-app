// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailVoAdapter extends TypeAdapter<MovieDetailVo> {
  @override
  final int typeId = 4;

  @override
  MovieDetailVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailVo(
      fields[0] as bool?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as double?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool?,
      fields[12] as double?,
      fields[13] as int?,
      fields[14] as double?,
      fields[16] as String?,
      fields[17] as String?,
      fields[18] as int?,
      fields[19] as int?,
      fields[20] as String?,
      fields[21] as String?,
      fields[22] as bool?,
      fields[23] as bool?,
      fields[24] as bool?,
    )..genres = (fields[15] as List?)?.cast<GenreVo>();
  }

  @override
  void write(BinaryWriter writer, MovieDetailVo obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount)
      ..writeByte(14)
      ..write(obj.budget)
      ..writeByte(15)
      ..write(obj.genres)
      ..writeByte(16)
      ..write(obj.homePage)
      ..writeByte(17)
      ..write(obj.imdbId)
      ..writeByte(18)
      ..write(obj.revenue)
      ..writeByte(19)
      ..write(obj.runTime)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.tagLine)
      ..writeByte(22)
      ..write(obj.isNowPlaying)
      ..writeByte(23)
      ..write(obj.isPopular)
      ..writeByte(24)
      ..write(obj.isTopRated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailVo _$MovieDetailVoFromJson(Map<String, dynamic> json) =>
    MovieDetailVo(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      (json['budget'] as num?)?.toDouble(),
      json['homepage'] as String?,
      json['imdb_id'] as String?,
      json['revenue'] as int?,
      json['runtime'] as int?,
      json['status'] as String?,
      json['tagline'] as String?,
      json['isNowPlaying'] as bool?,
      json['isPopular'] as bool?,
      json['isTopRated'] as bool?,
    )..genres = (json['genres'] as List<dynamic>?)
        ?.map((e) => GenreVo.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$MovieDetailVoToJson(MovieDetailVo instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homePage,
      'imdb_id': instance.imdbId,
      'revenue': instance.revenue,
      'runtime': instance.runTime,
      'status': instance.status,
      'tagline': instance.tagLine,
      'isNowPlaying': instance.isNowPlaying,
      'isPopular': instance.isPopular,
      'isTopRated': instance.isTopRated,
    };
