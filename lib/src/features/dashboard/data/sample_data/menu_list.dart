

import 'package:flutter/material.dart';
import 'package:hrm/src/features/attendance_records/presentation/ui/attendance_records.dart';
import 'package:hrm/src/features/departments/presentation/ui/all_departments.dart';
import 'package:hrm/src/features/desginations/presentation/ui/desginations.dart';
import 'package:hrm/src/features/leave/presentation/ui/leave_list.dart';
import 'package:hrm/src/features/leave_request/presentation/ui/leave_request.dart';

import '../../../admin_dashboard/presentation/ui/admin_dashboard.dart';
import '../../../attendance/presentation/ui/attendance.dart';
import '../../../employees/presentation/ui/all_employees.dart';
import '../../../events/presentation/ui/events.dart';
import '../../../holidays/presentation/ui/holidays.dart';
import '../../../policy/presentation/ui/policy.dart';
import '../../domain/model/dashboard_model.dart';
import '../../presentation/ui/presentation.dart';

List<DashboardModel> dashboardItems = [
  DashboardModel(
      index: 0,
      title: 'Dashboard',
      icon: Icons.dashboard,
      route: Dashboard()),

  DashboardModel(
      index: 1,
      title: 'Admin Dashboard',
      icon: Icons.dashboard,
      route: AdminDashboard()),

  DashboardModel(
    index: 2,
    title: 'Employees',
    icon: Icons.groups,
    isExpansionTile: true,
    children: [
      DashboardModel(
          index: 2,
          title: 'All Employees',
          icon: Icons.people,
          route: AllEmployees()),

      DashboardModel(
          index: 3,
          title: 'Departments',
          icon: Icons.business,
          route: AllDepartments()),

      DashboardModel(
          index: 4,
          title: 'Designations',
          icon: Icons.business_center_rounded,
          route: AllDesignations()),
    ],
  ),

  DashboardModel(
    index: 5,
    title: 'Attendance',
    icon: Icons.schedule,
    isExpansionTile: true,
    children: [
      DashboardModel(
          index: 5,
          title: 'Attendances',
          icon: Icons.access_time,
          route: Attendance()),

      DashboardModel(
          index: 6,
          title: 'Records',
          icon: Icons.history,
          route: AttendanceRecords()),

      DashboardModel(
          index: 7,
          title: 'Absents',
          icon: Icons.cancel,
          route: LeaveList()),

      DashboardModel(
          index: 8,
          title: 'Leave Requests',
          icon: Icons.event_note,
          route: LeaveRequestList()),
    ],
  ),

  DashboardModel(
      index: 9,
      title: 'Events',
      icon: Icons.event,
      route: Events()),

  DashboardModel(
      index: 10,
      title: 'Holidays',
      icon: Icons.event_available,
      route: Holidays()),

  DashboardModel(
      index: 11,
      title: 'Policy',
      icon: Icons.policy_outlined,
      route: Policy()),
];
