import 'package:bloc/bloc.dart';

import '../../data/models/lawyer_model.dart';
import '../../data/repositories/lawyer_repository.dart';
import '../../data/services/users_services.dart';

import 'lawyer_event.dart';
import 'lawyer_state.dart';

class LawyerBloc extends Bloc<LawyerEvent, LawyerState> {
  LawyerBloc() : super(LawyerInitial()) {
    on<LawyerEvent>((event, emit) async {
      if (event is GetAllLawyersEvent) {
        emit(
          LawyerLoading(),
        );
        try {
          List<LawyerModel> lawyersList =
              await LawyerRepository().getAllLawyers();
          emit(
            LawyersListLoaded(
              lawyersList: lawyersList,
            ),
          );
        } catch (e) {
          emit(
            LawyerFail(
              errorMsg: e.toString(),
            ),
          );
        }
      } else if (event is DeleteLawyerByIdEvent) {
        emit(
          LawyerLoading(),
        );

        try {
          String successMsg =
              await UsersServices().deleteUserById(event.lawyerId);
          emit(
            LawyerSuccess(
              successMsg: successMsg,
            ),
          );
        } catch (e) {
          emit(
            LawyerFail(
              errorMsg: e.toString(),
            ),
          );
        }
      }
      // else if (event is GetLawyerById) {
      //   emit(LawyerLoading());
      //   try {
      //     LawyerModel lawyer = await LawyerServices().getLawyerById(event.lawyerId);
      //     emit(LawyerInfoByIdLoaded(lawyerModel: lawyer));
      //   } catch (e) {
      //     emit(LawyerFail(errorMsg: e.toString()));
      //   }
      // }
    });
  }
}
