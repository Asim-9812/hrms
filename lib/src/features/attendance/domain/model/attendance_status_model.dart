




class AttendanceStatusModel{

  final DateTime dateTime;
  final String month;
  final int year;
  final int totalDays;
  final int attendedDays;
  final int leave;

  AttendanceStatusModel({
    required this.dateTime,
    required this.year,
    required this.month,
    required this.attendedDays,
    required this.leave,
    required this.totalDays
});

}