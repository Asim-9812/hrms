import 'package:json_annotation/json_annotation.dart';

part 'leave_model.g.dart';

@JsonSerializable()
class LeaveModel {
  @JsonKey(name: 'LeaveId')
  final int leaveId;
  @JsonKey(name: 'EmployeeId')
  final int employeeId;
  @JsonKey(name: 'EmployeeName')
  final String employeeName;
  @JsonKey(name: 'IdEnroll')
  final int idEnroll;
  @JsonKey(name: 'empcode')
  final String empcode;
  @JsonKey(name: 'remarks')
  final String? remarks;
  @JsonKey(name: 'Subject')
  final String subject;
  @JsonKey(name: 'FromDate')
  final DateTime fromDate;
  @JsonKey(name: 'ToDate')
  final DateTime toDate;
  @JsonKey(name: 'totalDay')
  final int totalDay;
  @JsonKey(name: 'Reason')
  final String reason;
  @JsonKey(name: 'Name')
  final String? name;
  @JsonKey(name: 'letterto')
  final String? letterto;
  @JsonKey(name: 'salutation')
  final String? salutation;
  @JsonKey(name: 'header')
  final String? header;
  @JsonKey(name: 'includeheader')
  final bool includeheader;
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'LeaveTitle')
  final String? leaveTitle;
  @JsonKey(name: 'LeaveType')
  final String leaveType;
  @JsonKey(name: 'Status')
  final String status;
  @JsonKey(name: 'CreatedOn')
  final DateTime createdOn;
  @JsonKey(name: 'UpdatedOn')
  final DateTime updatedOn;
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @JsonKey(name: 'Flag')
  final String? flag;
  @JsonKey(name: 'leavenarration')
  final String? leavenarration;
  @JsonKey(name: 'fromNepaliDate')
  final String? fromNepaliDate;
  @JsonKey(name: 'fromDateChangeSetting')
  final String? fromDateChangeSetting;
  @JsonKey(name: 'toNepaliDate')
  final String? toNepaliDate;
  @JsonKey(name: 'toDateChangeSetting')
  final String? toDateChangeSetting;
  @JsonKey(name: 'totalPresentLeave')
  final String? totalPresentLeave;

  LeaveModel({
    required this.leaveId,
    required this.employeeId,
    required this.employeeName,
    required this.idEnroll,
    required this.empcode,
    this.remarks,
    required this.subject,
    required this.fromDate,
    required this.toDate,
    required this.totalDay,
    required this.reason,
    this.name,
    this.letterto,
    this.salutation,
    this.header,
    required this.includeheader,
    required this.id,
    this.leaveTitle,
    required this.leaveType,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
    this.createdBy,
    this.updatedBy,
    this.flag,
    this.leavenarration,
    this.fromNepaliDate,
    this.fromDateChangeSetting,
    this.toNepaliDate,
    this.toDateChangeSetting,
    this.totalPresentLeave,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) => _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);

  factory LeaveModel.empty() => LeaveModel(
    leaveId: 0,
    employeeId: 0,
    employeeName: '',
    idEnroll: 0,
    empcode: '',
    subject: '',
    fromDate: DateTime.now(),
    toDate: DateTime.now(),
    totalDay: 0,
    reason: '',
    includeheader: false,
    id: 0,
    leaveType: '',
    status: '',
    createdOn: DateTime.now(),
    updatedOn: DateTime.now(),
  );
}