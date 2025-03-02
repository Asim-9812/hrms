// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      attendanceId: (json['AttendanceId'] as num?)?.toInt(),
      employeeId: (json['EmployeeId'] as num?)?.toInt(),
      idEnroll: (json['IdEnroll'] as num?)?.toInt(),
      empCode: json['empcode'] as String?,
      employeeName: json['EmployeeName'] as String?,
      date: json['Date'] as String?,
      dateCheckForAbsent: json['dateCheckForAbsent'] as String?,
      changeDateSetting: json['changeDateSetting'] as String?,
      checkInTime: json['CheckInTime'] as String?,
      checkOutTime: json['CheckOutTime'] as String?,
      noOfPunch: (json['No_OfPunch'] as num?)?.toInt(),
      shift: json['Shift'] as String?,
      status: json['Status'] as String?,
      createdOn: json['CreatedOn'] as String?,
      createdBy: json['CreatedBy'] as String?,
      remarks: json['Remarks'] as String?,
      flag: json['Flag'] as String?,
      depID: (json['depID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      empFirstName: json['empFirstName'] as String?,
      empLastName: json['empLastName'] as String?,
      punchNepaliDate: json['punchNepaliDate'] as String?,
      changeDateSettingM: json['changeDateSettingM'] as String?,
      changeDateSettingCreatedOn: json['changeDateSettingCreatedOn'] as String?,
      fromDate: json['fromdate'] as String?,
      toDate: json['todate'] as String?,
      totalWorkTime: json['TotalWorkTime'] as String?,
      department: (json['department'] as num?)?.toInt(),
      empName: json['empname'] as String?,
      designation: json['designation'] as String?,
      nepaliDate: json['Nepalidate'] as String?,
      levelName: json['LevelName'] as String?,
      jobShift: json['JobShift'] as String?,
      totalPresentEmp: json['totalPresentEmp'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'AttendanceId': instance.attendanceId,
      'EmployeeId': instance.employeeId,
      'IdEnroll': instance.idEnroll,
      'empcode': instance.empCode,
      'EmployeeName': instance.employeeName,
      'Date': instance.date,
      'dateCheckForAbsent': instance.dateCheckForAbsent,
      'changeDateSetting': instance.changeDateSetting,
      'CheckInTime': instance.checkInTime,
      'CheckOutTime': instance.checkOutTime,
      'No_OfPunch': instance.noOfPunch,
      'Shift': instance.shift,
      'Status': instance.status,
      'CreatedOn': instance.createdOn,
      'CreatedBy': instance.createdBy,
      'Remarks': instance.remarks,
      'Flag': instance.flag,
      'depID': instance.depID,
      'DepartmentName': instance.departmentName,
      'empFirstName': instance.empFirstName,
      'empLastName': instance.empLastName,
      'punchNepaliDate': instance.punchNepaliDate,
      'changeDateSettingM': instance.changeDateSettingM,
      'changeDateSettingCreatedOn': instance.changeDateSettingCreatedOn,
      'fromdate': instance.fromDate,
      'todate': instance.toDate,
      'TotalWorkTime': instance.totalWorkTime,
      'department': instance.department,
      'empname': instance.empName,
      'designation': instance.designation,
      'Nepalidate': instance.nepaliDate,
      'LevelName': instance.levelName,
      'JobShift': instance.jobShift,
      'totalPresentEmp': instance.totalPresentEmp,
    };
