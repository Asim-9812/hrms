






import 'package:hrm/src/features/leave/domain/model/leave_model.dart';

abstract class LeaveRepository {
  Future<List<LeaveModel>> fetchLeaveList();
}
