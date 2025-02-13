



import 'package:hrm/src/features/admin_dashboard/presentation/ui/admin_dashboard.dart';
import 'package:hrm/src/features/attendance/presentation/ui/attendance.dart';
import 'package:hrm/src/features/attendance_records/presentation/ui/attendance_records.dart';
import 'package:hrm/src/features/dashboard/presentation/ui/presentation.dart';
import 'package:hrm/src/features/departments/presentation/ui/all_departments.dart';
import 'package:hrm/src/features/desginations/presentation/ui/desginations.dart';
import 'package:hrm/src/features/employees/presentation/ui/all_employees.dart';
import 'package:hrm/src/features/events/presentation/ui/events.dart';
import 'package:hrm/src/features/holidays/presentation/ui/holidays.dart';
import 'package:hrm/src/features/homepage/presentation/ui/homepage.dart';
import 'package:hrm/src/features/leave/presentation/ui/leave_list.dart';
import 'package:hrm/src/features/leave_request/presentation/ui/leave_request.dart';
import 'package:hrm/src/features/policy/presentation/ui/policy.dart';

final dashboardPageList= [

  Homepage(),
  AdminDashboard(),
  AllEmployees(),
  AllDepartments(),
  AllDesignations(),
  Attendance(),
  AttendanceRecords(),
  LeaveList(),
  LeaveRequestList(),
  Events(),
  Holidays(),
  Policy(),

];