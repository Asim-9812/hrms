import 'package:json_annotation/json_annotation.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel {
  @JsonKey(name: "AttendanceId")
  final int? attendanceId;

  @JsonKey(name: "EmployeeId")
  final int? employeeId;

  @JsonKey(name: "IdEnroll")
  final int? idEnroll;

  @JsonKey(name: "empcode")
  final String? empCode;

  @JsonKey(name: "EmployeeName")
  final String? employeeName;

  @JsonKey(name: "Date")
  final String? date;

  @JsonKey(name: "dateCheckForAbsent")
  final String? dateCheckForAbsent;

  @JsonKey(name: "changeDateSetting")
  final String? changeDateSetting;

  @JsonKey(name: "CheckInTime")
  final String? checkInTime;

  @JsonKey(name: "CheckOutTime")
  final String? checkOutTime;

  @JsonKey(name: "No_OfPunch")
  final int? noOfPunch;

  @JsonKey(name: "Shift")
  final String? shift;

  @JsonKey(name: "Status")
  final String? status;

  @JsonKey(name: "CreatedOn")
  final String? createdOn;

  @JsonKey(name: "CreatedBy")
  final String? createdBy;

  @JsonKey(name: "Remarks")
  final String? remarks;

  @JsonKey(name: "Flag")
  final String? flag;

  @JsonKey(name: "depID")
  final int? depID;

  @JsonKey(name: "DepartmentName")
  final String? departmentName;

  @JsonKey(name: "empFirstName")
  final String? empFirstName;

  @JsonKey(name: "empLastName")
  final String? empLastName;

  @JsonKey(name: "punchNepaliDate")
  final String? punchNepaliDate;

  @JsonKey(name: "changeDateSettingM")
  final String? changeDateSettingM;

  @JsonKey(name: "changeDateSettingCreatedOn")
  final String? changeDateSettingCreatedOn;

  @JsonKey(name: "fromdate")
  final String? fromDate;

  @JsonKey(name: "todate")
  final String? toDate;

  @JsonKey(name: "TotalWorkTime")
  final String? totalWorkTime;

  @JsonKey(name: "department")
  final int? department;

  @JsonKey(name: "empname")
  final String? empName;

  @JsonKey(name: "designation")
  final String? designation;

  @JsonKey(name: "Nepalidate")
  final String? nepaliDate;

  @JsonKey(name: "LevelName")
  final String? levelName;

  @JsonKey(name: "JobShift")
  final String? jobShift;

  @JsonKey(name: "totalPresentEmp")
  final String? totalPresentEmp;

  AttendanceModel({
    this.attendanceId,
    this.employeeId,
    this.idEnroll,
    this.empCode,
    this.employeeName,
    this.date,
    this.dateCheckForAbsent,
    this.changeDateSetting,
    this.checkInTime,
    this.checkOutTime,
    this.noOfPunch,
    this.shift,
    this.status,
    this.createdOn,
    this.createdBy,
    this.remarks,
    this.flag,
    this.depID,
    this.departmentName,
    this.empFirstName,
    this.empLastName,
    this.punchNepaliDate,
    this.changeDateSettingM,
    this.changeDateSettingCreatedOn,
    this.fromDate,
    this.toDate,
    this.totalWorkTime,
    this.department,
    this.empName,
    this.designation,
    this.nepaliDate,
    this.levelName,
    this.jobShift,
    this.totalPresentEmp,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);

  factory AttendanceModel.empty() => AttendanceModel();
}
