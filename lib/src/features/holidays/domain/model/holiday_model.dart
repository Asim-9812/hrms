import 'package:json_annotation/json_annotation.dart';

part 'holiday_model.g.dart';

@JsonSerializable()
class HolidayModel {
  @JsonKey(name: 'HolidayId')
  final int? holidayId;
  @JsonKey(name: 'Holidaytitle')
  final String? holidayTitle;
  @JsonKey(name: 'StartDate')
  final String? startDate;
  @JsonKey(name: 'EndDate')
  final String? endDate;
  @JsonKey(name: 'TotalDay')
  final int? totalDay;
  @JsonKey(name: 'Description')
  final String? description;
  @JsonKey(name: 'fiscalyear')
  final String? fiscalYear;
  @JsonKey(name: 'Flag')
  final String? flag;
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @JsonKey(name: 'RoomName')
  final String? roomName;
  @JsonKey(name: 'fromDate')
  final String? fromDate;
  @JsonKey(name: 'fromDateChangeSetting')
  final String? fromDateChangeSetting;
  @JsonKey(name: 'toDate')
  final String? toDate;
  @JsonKey(name: 'toDateChangeSetting')
  final String? toDateChangeSetting;

  HolidayModel({
    this.holidayId,
    this.holidayTitle,
    this.startDate,
    this.endDate,
    this.totalDay,
    this.description,
    this.fiscalYear,
    this.flag,
    this.departmentName,
    this.roomName,
    this.fromDate,
    this.fromDateChangeSetting,
    this.toDate,
    this.toDateChangeSetting,
  });

  factory HolidayModel.fromJson(Map<String, dynamic> json) => _$HolidayModelFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);

  factory HolidayModel.empty() => HolidayModel(
    holidayId: null,
    holidayTitle: null,
    startDate: null,
    endDate: null,
    totalDay: null,
    description: null,
    fiscalYear: null,
    flag: null,
    departmentName: null,
    roomName: null,
    fromDate: null,
    fromDateChangeSetting: null,
    toDate: null,
    toDateChangeSetting: null,
  );
}
