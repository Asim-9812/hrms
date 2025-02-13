


import '../../../notice/domain/model/notice_model.dart';
import '../../data/repositories/department_repository.dart';

class GetDepartmentNotices {
  final DepartmentRepository repository;

  GetDepartmentNotices(this.repository);

  Future<List<NoticeModel>> call({required String deptName}) {
    return repository.fetchDepartmentNotices(deptName: deptName);
  }
}
