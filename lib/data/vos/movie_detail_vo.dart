import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';
import 'genre_vo.dart';

part 'movie_detail_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_MOVIE_DETAIL_VO, adapterName: "MovieDetailVoAdapter")
class MovieDetailVo {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: "id")
  @HiveField(3)
  int? id;

  @JsonKey(name: "original_language")
  @HiveField(4)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(5)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(6)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(7)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(8)
  String? posterPath;

  @JsonKey(name: "release_date")
  @HiveField(9)
  String? releaseDate;

  @JsonKey(name: "title")
  @HiveField(10)
  String? title;

  @JsonKey(name: "video")
  @HiveField(11)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(12)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(13)
  int? voteCount;


  @JsonKey(name: "budget")
  @HiveField(14)
  double? budget;

  @JsonKey(name: "genres")
  @HiveField(15)
  List<GenreVo>? genres;

  @JsonKey(name: "homepage")
  @HiveField(16)
  String? homePage;

  @JsonKey(name: "imdb_id")
  @HiveField(17)
  String? imdbId;


  @JsonKey(name: "revenue")
  @HiveField(18)
  int? revenue;

  @JsonKey(name: "runtime")
  @HiveField(19)
  int? runTime;

  @JsonKey(name: "status")
  @HiveField(20)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(21)
  String? tagLine;

  @HiveField(22)
  bool? isNowPlaying;

  @HiveField(23)
  bool? isPopular;

  @HiveField(24)
  bool? isTopRated;


  MovieDetailVo(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.budget,
      this.homePage,
      this.imdbId,
      this.revenue,
      this.runTime,
      this.status,
      this.tagLine,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated);

  factory MovieDetailVo.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailVoFromJson(json);

  String getGenreListAsCommaSeparatedString() {
    return getGenreListAsStringList().join(", ");
  }

  List<String> getGenreListAsStringList() {
    return genres?.map((genre) => genre.name ?? "").toList() ?? [];
  }


  Map<String, dynamic> toJson() => _$MovieDetailVoToJson(this);

  @override
  String toString() {
    return 'MovieDetailVo{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, budget: $budget, genres: $genres, homePage: $homePage, imdbId: $imdbId, revenue: $revenue, runTime: $runTime, status: $status, tagLine: $tagLine, isNowPlaying: $isNowPlaying, isPopular: $isPopular, isTopRated: $isTopRated}';
  }
}
