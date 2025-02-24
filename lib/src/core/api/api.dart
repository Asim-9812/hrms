



class Api{


  static const baseUrl = 'http://202.51.74.138:6721/api';

  static const login = '$baseUrl/User/Login';


  static const getAllNotices = '$baseUrl/Notice/GetAllNotice';


  static const getAttendance = '$baseUrl/AttendanceManage/GetAllAttendance';


  static const getAllHolidays = '$baseUrl/PublicHoliday/GetAllPublicHolidayList';



  static const getAllDepartments = '$baseUrl/Department/GetAllDepartment';
  static const getEmployeesByDepartment = '$baseUrl/Employee/DepartmentEmployee';

}