
abstract class LawyerEvent {}

class FetchAllLawyers extends LawyerEvent {}

class FetchLawyerById extends LawyerEvent {
  final int id;
  FetchLawyerById(this.id);
}


class LoadLawyerEvent extends LawyerEvent {}

class UpdateLawyerSalaryEvent extends LawyerEvent {
  final String salary;
  UpdateLawyerSalaryEvent(this.salary);
}