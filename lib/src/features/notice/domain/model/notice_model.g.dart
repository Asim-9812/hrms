// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      noticeid: (json['noticeid'] as num).toInt(),
      notice: json['notice'] as String,
      noticedetails: json['noticedetails'] as String,
      Noticefromdate: json['Noticefromdate'] as String,
      Noticetodate: json['Noticetodate'] as String,
      department: json['department'] as String,
      noticefrom: json['noticefrom'] as String,
      countnotice: json['countnotice'],
      fromDateChangeSetting: json['fromDateChangeSetting'] as String,
      toDateChangeSetting: json['toDateChangeSetting'] as String,
      fromdatest: json['fromdatest'] as String,
      totalnotice: json['totalnotice'],
      includeheader: json['includeheader'] as bool,
      todatest: json['todatest'] as String,
      sentmail: json['sentmail'],
      employee: json['employee'],
      empid: (json['empid'] as num).toInt(),
      deptId: (json['deptId'] as num).toInt(),
      fullname: json['fullname'],
      designation: json['designation'],
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'noticeid': instance.noticeid,
      'notice': instance.notice,
      'noticedetails': instance.noticedetails,
      'Noticefromdate': instance.Noticefromdate,
      'Noticetodate': instance.Noticetodate,
      'department': instance.department,
      'noticefrom': instance.noticefrom,
      'countnotice': instance.countnotice,
      'fromDateChangeSetting': instance.fromDateChangeSetting,
      'toDateChangeSetting': instance.toDateChangeSetting,
      'fromdatest': instance.fromdatest,
      'totalnotice': instance.totalnotice,
      'includeheader': instance.includeheader,
      'todatest': instance.todatest,
      'sentmail': instance.sentmail,
      'employee': instance.employee,
      'empid': instance.empid,
      'deptId': instance.deptId,
      'fullname': instance.fullname,
      'designation': instance.designation,
    };
