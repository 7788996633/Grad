import 'package:bloc/bloc.dart';
import 'package:graduation/data/models/lawyer_model.dart';
import 'package:graduation/data/services/lawyer_profile_services.dart';
import 'package:meta/meta.dart';

part 'lawyer_profile_event.dart';
part 'lawyer_profile_state.dart';

class LawyerProfileBloc extends Bloc<LawyerProfileEvent, LawyerProfileState> {
  LawyerProfileBloc() : super(LawyerProfileInitial()) {
    on<LawyerProfileEvent>((event, emit) async {
      if (event is CreateLawyerProfileEvent) {
        emit(
          LawyerProfileLoading(),
        );
        try {
          String value = await LawyerProfileServices().creatLawyerProrile(
              event.licenseNumber,
              event.experienceYears,
              event.specialization,
              event.certificatePath);
          emit(
            LawyerProfileSuccess(successmsg: value),
          );
        } catch (e) {
          emit(
            LawyerProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is ShowLawyerProfileEvent) {
        emit(
          LawyerProfileLoading(),
        );
        try {
          LawyerModel value =
              await LawyerProfileServices().getMyLawyerProfile();
          emit(
            LawyerProfileLoadedSuccessfully(lawyerModel: value),
          );
        } catch (e) {
          emit(
            LawyerProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is UpdateLawyerProfileEvent) {
        emit(
          LawyerProfileLoading(),
        );
        try {
          String value = await LawyerProfileServices().creatLawyerProrile(
              event.licenseNumber,
              event.experienceYears,
              event.specialization,
              event.certificatePath);
          emit(
            LawyerProfileSuccess(successmsg: value),
          );
        } catch (e) {
          emit(
            LawyerProfileFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    },);
  }
}
