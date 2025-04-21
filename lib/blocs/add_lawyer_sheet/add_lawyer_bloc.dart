import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/add_lawyer_service.dart';
import 'add_lawyer_event.dart';
import 'add_lawyer_state.dart';

class AddLawyerBloc extends Bloc<AddLawyerEvent, AddLawyerState> {
  final AddLawyerService service;
  final int userId;
  final String token;

  AddLawyerBloc({
    required this.service,
    required this.userId,
    required this.token,
  }) : super(AddLawyerInitial()) {
    on<SubmitLawyerData>(_onSubmitLawyerData);
  }

  Future<void> _onSubmitLawyerData(
      SubmitLawyerData event, Emitter<AddLawyerState> emit) async {
    print("License Number: ${event.licenseNumber}");
    print("Experience Years: ${event.experienceYears}");
    print("Specialization: ${event.specialization}");
    print("Salary: ${event.salary}");
    print("Certificate File Path: ${event.filePath}");
    print("User ID: $userId");
    print("Token: $token");

    emit(AddLawyerLoading());
    try {
      final success = await service.uploadLawyerData(event, userId, token);
      if (success) {
        print("Data uploaded successfully!");
        emit(AddLawyerSuccess(token: token));
      } else {
        print("Failed to upload data.");
        emit(AddLawyerFailure(error: "Failed to upload."));
      }
    } catch (e) {
      print("Error during upload: $e");
      emit(AddLawyerFailure(error: e.toString()));
    }
  }
}
