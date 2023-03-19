import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/data/vos/actor_vo.dart';

part 'get_credits_by_movie_response.g.dart';

@JsonSerializable()
class GetCreditsByMovieResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "cast")
  List<ActorVo>? cast;

  @JsonKey(name: "crew")
  List<ActorVo>? crew;

  GetCreditsByMovieResponse(this.id, this.cast, this.crew);

  factory GetCreditsByMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCreditsByMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCreditsByMovieResponseToJson(this);
}
