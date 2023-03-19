import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

part 'user_data_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_USER_DATA_VO, adapterName: "UserDataVoAdapter")
class UserDataVo {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? phone;

  @JsonKey(name: 'total_expense')
  @HiveField(4)
  final int? totalExpense;

  @JsonKey(name: 'profile_image')
  @HiveField(5)
  final String? profileImage;

  @HiveField(6)
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
