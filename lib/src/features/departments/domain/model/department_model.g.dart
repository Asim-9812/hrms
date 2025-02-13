// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      id: (json['Id'] as num).toInt(),
      name: json['Name'] as String,
      status: json['Status'] as bool,
      workingDays: json['WorkingDays'] as String,
      startTime: json['StartTime'] as String,
      endTime: json['EndTime'] as String,
      workingHour: json['WorkingHour'] as String,
      flag: json['Flag'] as String?,
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Status': instance.status,
      'WorkingDays': instance.workingDays,
      'StartTime': instance.startTime,
      'EndTime': instance.endTime,
      'WorkingHour': instance.workingHour,
      'Flag': instance.flag,
    };
