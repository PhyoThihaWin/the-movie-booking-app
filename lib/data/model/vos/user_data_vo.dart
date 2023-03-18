import 'package:json_annotation/json_annotation.dart';

part 'user_data_vo.g.dart';

@JsonSerializable()
class UserDataVo {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  @JsonKey(name: 'total_expense')
  final int? totalExpense;

  @JsonKey(name: 'profile_image')
  final String? profileImage;

  String? token;

  UserDataVo(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.totalExpense,
      this.profileImage,
      this.token});

  factory UserDataVo.fromJson(Map<String, dynamic> json) =>
      _$UserDataVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataVoToJson(this);
}
