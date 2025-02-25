
import '../../data/repositories/leave_repository.dart';
import '../model/leave_model.dart';

class GetLeaveList {
  final LeaveRepository repository;

  GetLeaveList(this.repository);

  Future<List<LeaveModel>> call() {
    return repository.fetchLeaveList();
  }
}
