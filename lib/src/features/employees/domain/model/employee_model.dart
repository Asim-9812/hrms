


import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  @JsonKey(name: "empId")
  final int empId;

  @JsonKey(name: "biometricId")
  final int biometricId;

  @JsonKey(name: "empFirstName")
  final String? empFirstName;

  @JsonKey(name: "empLastName")
  final String? empLastName;

  @JsonKey(name: "DOB")
  final String? dob;

  @JsonKey(name: "age")
  final int? age;

  @JsonKey(name: "Gender")
  final String? gender;

  @JsonKey(name: "LocalAddress")
  final String? localAddress;

  @JsonKey(name: "PermanentAddress")
  final String? permanentAddress;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "Contact1")
  final String? contact1;

  @JsonKey(name: "Contact2")
  final String? contact2;

  @JsonKey(name: "bloodgroup")
  final String? bloodgroup;

  @JsonKey(name: "Reference1")
  final String? reference1;

  @JsonKey(name: "Reference2")
  final String? reference2;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "MaritalStatus")
  final String? maritalStatus;

  @JsonKey(name: "BankName")
  final String? bankName;

  @JsonKey(name: "AccountHolderName")
  final String? accountHolderName;

  @JsonKey(name: "AccountNumber")
  final String? accountNumber;

  @JsonKey(name: "BranchName")
  final String? branchName;

  @JsonKey(name: "status")
  final bool status;

  @JsonKey(name: "File")
  final String? file;

  @JsonKey(name: "userName")
  final String? userName;

  @JsonKey(name: "userPassword")
  final String? userPassword;

  @JsonKey(name: "remarks")
  final String? remarks;

  @JsonKey(name: "role")
  final int role;

  @JsonKey(name: "empcode")
  final String? empcode;

  @JsonKey(name: "changepass")
  final String? changepass;

  @JsonKey(name: "employeetype")
  final int employeetype;

  @JsonKey(name: "department")
  final int department;

  @JsonKey(name: "levelid")
  final int levelid;

  @JsonKey(name: "pan")
  final String? pan;

  @JsonKey(name: "entryDate")
  final String? entryDate;

  @JsonKey(name: "fromDepName")
  final String? fromDepName;

  @JsonKey(name: "toDepName")
  final String? toDepName;

  @JsonKey(name: "dateUpdate")
  final String? dateUpdate;

  @JsonKey(name: "designation")
  final String? designation;

  @JsonKey(name: "fromLevelName")
  final String? fromLevelName;

  @JsonKey(name: "toLevelName")
  final String? toLevelName;

  @JsonKey(name: "ValidDate")
  final String? validDate;

  @JsonKey(name: "joinDate")
  final String? joinDate;

  @JsonKey(name: "reportEmpTypeLst")
  final String? reportEmpTypeLst;

  @JsonKey(name: "employeeIdd")
  final int employeeIdd;

  @JsonKey(name: "joinDateChangeSetting")
  final String? joinDateChangeSetting;

  @JsonKey(name: "validDateChangeSetting")
  final String? validDateChangeSetting;

  @JsonKey(name: "empValidDateExpired")
  final String? empValidDateExpired;

  @JsonKey(name: "totalEmployee")
  final int? totalEmployee;

  @JsonKey(name: "totalAbsentEmp")
  final int? totalAbsentEmp;

  @JsonKey(name: "changeDateSetting")
  final String? changeDateSetting;

  @JsonKey(name: "lmunicipality")
  final String? lmunicipality;

  @JsonKey(name: "lward")
  final String? lward;

  @JsonKey(name: "lDistrict")
  final String? lDistrict;

  @JsonKey(name: "pmunicipality")
  final String? pmunicipality;

  @JsonKey(name: "pward")
  final String? pward;

  @JsonKey(name: "pDistrict")
  final String? pDistrict;

  @JsonKey(name: "Flag")
  final String? flag;

  EmployeeModel({
    required this.empId,
    required this.biometricId,
    this.empFirstName,
    this.empLastName,
    this.dob,
    this.age,
    this.gender,
    this.localAddress,
    this.permanentAddress,
    this.email,
    this.contact1,
    this.contact2,
    this.bloodgroup,
    this.reference1,
    this.reference2,
    this.image,
    this.maritalStatus,
    this.bankName,
    this.accountHolderName,
    this.accountNumber,
    this.branchName,
    required this.status,
    this.file,
    this.userName,
    this.userPassword,
    this.remarks,
    required this.role,
    this.empcode,
    this.changepass,
    required this.employeetype,
    required this.department,
    required this.levelid,
    this.pan,
    this.entryDate,
    this.fromDepName,
    this.toDepName,
    this.dateUpdate,
    this.designation,
    this.fromLevelName,
    this.toLevelName,
    this.validDate,
    this.joinDate,
    this.reportEmpTypeLst,
    required this.employeeIdd,
    this.joinDateChangeSetting,
    this.validDateChangeSetting,
    this.empValidDateExpired,
    this.totalEmployee,
    this.totalAbsentEmp,
    this.changeDateSetting,
    this.lmunicipality,
    this.lward,
    this.lDistrict,
    this.pmunicipality,
    this.pward,
    this.pDistrict,
    this.flag,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  factory EmployeeModel.empty() => EmployeeModel(empId: 0, biometricId: 0, status: false, role: 0, employeetype: 0, department: 0, levelid: 0, employeeIdd: 0);
}
