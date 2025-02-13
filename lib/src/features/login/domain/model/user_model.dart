
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModel {
  @HiveField(0)
  final String UserName;

  @HiveField(1)
  final String Token;

  UserModel({
    required this.UserName,
    required this.Token,
  });

  // Empty model
  factory UserModel.empty() => UserModel(UserName: '', Token: '');

  // JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
