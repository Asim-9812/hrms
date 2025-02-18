// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) => HolidayModel(
      holidayId: (json['HolidayId'] as num?)?.toInt(),
      holidayTitle: json['Holidaytitle'] as String?,
      startDate: json['StartDate'] as String?,
      endDate: json['EndDate'] as String?,
      totalDay: (json['TotalDay'] as num?)?.toInt(),
      description: json['Description'] as String?,
      fiscalYear: json['fiscalyear'] as String?,
      flag: json['Flag'] as String?,
      departmentName: json['DepartmentName'] as String?,
      roomName: json['RoomName'] as String?,
      fromDate: json['fromDate'] as String?,
      fromDateChangeSetting: json['fromDateChangeSetting'] as String?,
      toDate: json['toDate'] as String?,
      toDateChangeSetting: json['toDateChangeSetting'] as String?,
    );

Map<String, dynamic> _$HolidayModelToJson(HolidayModel instance) =>
    <String, dynamic>{
      'HolidayId': instance.holidayId,
      'Holidaytitle': instance.holidayTitle,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'TotalDay': instance.totalDay,
      'Description': instance.description,
      'fiscalyear': instance.fiscalYear,
      'Flag': instance.flag,
      'DepartmentName': instance.departmentName,
      'RoomName': instance.roomName,
      'fromDate': instance.fromDate,
      'fromDateChangeSetting': instance.fromDateChangeSetting,
      'toDate': instance.toDate,
      'toDateChangeSetting': instance.toDateChangeSetting,
    };
