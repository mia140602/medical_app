abstract class TopDoctorEvent {}

class GetDoctorsEvent extends TopDoctorEvent {}
class GetDoctorsByDepartmentEvent extends TopDoctorEvent {
  final String? departmentId;

  GetDoctorsByDepartmentEvent(this.departmentId);
}