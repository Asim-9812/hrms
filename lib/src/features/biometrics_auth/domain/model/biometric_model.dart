



import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';


part 'biometric_model.g.dart';


@HiveType(typeId: 1)
@JsonSerializable()
class Biometrics {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  Biometrics({
    required this.code,
    required this.username,
    required this.password,
  });

  // Empty model
  factory Biometrics.empty() => Biometrics(code: '', username: '', password: '');

  // JSON serialization
  factory Biometrics.fromJson(Map<String, dynamic> json) => _$BiometricsFromJson(json);
  Map<String, dynamic> toJson() => _$BiometricsToJson(this);
}
