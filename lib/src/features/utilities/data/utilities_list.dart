




import '../../attendance/presentation/ui/attendance.dart';
import '../../calendar/presentation/ui/calendar.dart';
import '../../holidays/presentation/ui/holidays.dart';

final utilitiesList = [

  //index should match index in the list of dashboardItems (D:\hrm\lib\src\features\dashboard\data\sample_data\sample_menu_list.dart)

  {'name': 'Field Visit', 'image': 'assets/images/field_visit.png', 'route' : null},
  {'name': 'Leave', 'image': 'assets/images/leave.png', 'route' : null},
  {'name': 'Duty Roaster', 'image': 'assets/images/duty.png', 'route' : null},
  {'name': 'Attendances', 'image': 'assets/images/attendance.png', 'route' : Attendance()},
  {'name': 'Calendar', 'image': 'assets/images/holiday.png', 'route' : HrCalendar()},

];