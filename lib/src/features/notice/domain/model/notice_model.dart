
import 'package:json_annotation/json_annotation.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class NoticeModel {
  final int noticeid;
  final String notice;
  final String noticedetails;
  final String Noticefromdate;
  final String Noticetodate;
  final String department;
  final String noticefrom;
  final dynamic countnotice;
  final String fromDateChangeSetting;
  final String toDateChangeSetting;
  final String fromdatest;
  final dynamic totalnotice;
  final bool includeheader;
  final String todatest;
  final dynamic sentmail;
  final dynamic employee;
  final int empid;
  final int deptId;
  final dynamic fullname;
  final dynamic designation;

  NoticeModel({
    required this.noticeid,
    required this.notice,
    required this.noticedetails,
    required this.Noticefromdate,
    required this.Noticetodate,
    required this.department,
    required this.noticefrom,
    this.countnotice,
    required this.fromDateChangeSetting,
    required this.toDateChangeSetting,
    required this.fromdatest,
    this.totalnotice,
    required this.includeheader,
    required this.todatest,
    this.sentmail,
    this.employee,
    required this.empid,
    required this.deptId,
    this.fullname,
    this.designation,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);

  factory NoticeModel.empty() => NoticeModel(
    noticeid: 0,
    notice: '',
    noticedetails: '',
    Noticefromdate: '',
    Noticetodate: '',
    department: '',
    noticefrom: '',
    fromDateChangeSetting: '',
    toDateChangeSetting: '',
    fromdatest: '',
    includeheader: false,
    todatest: '',
    empid: 0,
    deptId: 0,
  );
}
