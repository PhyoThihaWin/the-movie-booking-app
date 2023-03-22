import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/trailer_video_vo.dart';

part 'get_trailer_video_response.g.dart';

@JsonSerializable()
class GetTrailerVideoResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "results")
  List<TrailerVideoVo>? results;

  GetTrailerVideoResponse(this.id, this.results);

  factory GetTrailerVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTrailerVideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTrailerVideoResponseToJson(this);
}
