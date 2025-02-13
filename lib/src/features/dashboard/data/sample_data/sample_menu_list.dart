

import 'package:flutter/material.dart';

import '../../domain/model/dashboard_model.dart';

List<DashboardModel> dashboardItems = [
  DashboardModel(index: 0, title: 'Dashboard', icon: Icons.dashboard), //Dashboard()
  DashboardModel(index: 1, title: 'Admin Dashboard', icon: Icons.dashboard), //AdminDashboard()
  DashboardModel(
    index: 2,
    title: 'Employees',
    icon: Icons.groups,
    isExpansionTile: true,
    children: [
      DashboardModel(index: 2, title: 'All Employees', icon: Icons.people), //AllEmployees()
      DashboardModel(index: 3, title: 'Department', icon: Icons.business), //Attendance()
      DashboardModel(index: 4, title: 'Designation', icon: Icons.business_center_rounded), //LeaveList()
    ],
  ),
  DashboardModel(
    index: 5,
    title: 'Attendance',
    icon: Icons.schedule,
    isExpansionTile: true,
    children: [
      DashboardModel(index: 5, title: 'Attendances', icon: Icons.access_time), //AllEmployees()
      DashboardModel(index: 6, title: 'Records', icon: Icons.history), //Attendance()
      DashboardModel(index: 7, title: 'Absents', icon: Icons.cancel), //LeaveList()
      DashboardModel(index: 8, title: 'Leave Requests', icon: Icons.event_note), //LeaveRequest()
    ],
  ),
  DashboardModel(index: 9, title: 'Events', icon: Icons.event), //Events()
  DashboardModel(index: 10, title: 'Holidays', icon: Icons.event_available), //Holidays()
  DashboardModel(index: 11, title: 'Policy', icon: Icons.policy_outlined), //Policy()
];
