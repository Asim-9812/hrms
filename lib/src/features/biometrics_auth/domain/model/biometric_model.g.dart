// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BiometricsAdapter extends TypeAdapter<Biometrics> {
  @override
  final int typeId = 1;

  @override
  Biometrics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Biometrics(
      code: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Biometrics obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BiometricsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Biometrics _$BiometricsFromJson(Map<String, dynamic> json) => Biometrics(
      code: json['code'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$BiometricsToJson(Biometrics instance) =>
    <String, dynamic>{
      'code': instance.code,
      'username': instance.username,
      'password': instance.password,
    };
