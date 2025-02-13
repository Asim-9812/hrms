
import 'package:json_annotation/json_annotation.dart';

part 'department_model.g.dart';

@JsonSerializable()
class DepartmentModel {
  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Status')
  final bool status;

  @JsonKey(name: 'WorkingDays')
  final String workingDays;

  @JsonKey(name: 'StartTime')
  final String startTime;

  @JsonKey(name: 'EndTime')
  final String endTime;

  @JsonKey(name: 'WorkingHour')
  final String workingHour;

  @JsonKey(name: 'Flag')
  final String? flag;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.status,
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.workingHour,
    this.flag,
  });

  // Empty model
  factory DepartmentModel.empty() {
    return DepartmentModel(
      id: 0,
      name: '',
      status: false,
      workingDays: '',
      startTime: '',
      endTime: '',
      workingHour: '',
      flag: null,
    );
  }

  // JSON conversion methods
  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);
}
