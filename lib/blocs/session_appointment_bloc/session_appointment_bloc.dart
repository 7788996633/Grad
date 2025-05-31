import 'package:bloc/bloc.dart';
import 'package:graduation/data/models/session_appointement_model.dart';
import 'package:meta/meta.dart';
import 'package:graduation/data/services/session_appointment_services.dart';
import 'package:graduation/data/repositories/session_appointment_repository.dart';


part 'session_appointment_event.dart';
part 'session_appointment_state.dart';

class SessionAppointmentBloc
    extends Bloc<SessionAppointmentEvent, SessionAppointmentState> {
  SessionAppointmentBloc() : super(SessionAppointmentInitial()) {
    on<SessionAppointmentEvent>((event, emit) async {
      if (event is AddAppiontmentEvent) {
        emit(
          SessionAppointmentLoading(),
        );
        try {
          String value = await SessionAppointmentServices()
              .addAppointment(event.type, event.date, event.sessionId);

          emit(SessionAppointmentSuccess(successmsg: value));
        } catch (e) {
          emit(
            SessionAppointmentFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is GetAppointmentEvent) {
        emit(
          SessionAppointmentLoading(),
        );
        try {
          SessionAppointementModel value = await SessionAppointmentServices()
              .getAppointment(event.idAddAppiontment);

          emit(
            SessionAppointmentLoadedSuccessfully(session: value),
          );
        } catch (e) {
          emit(
            SessionAppointmentFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is GetAllAppointmentBySessionEvent) {
        emit(
          SessionAppointmentLoading(),
        );
        try {
          List<SessionAppointementModel> value = await SessionAppointmentRepository()
              .getAllSeesion(event.sessionId);

          emit(
            SessionAppointmentListLoadedSuccessfully(listAppointemnt: value),
          );
        } catch (e) {
          emit(
            SessionAppointmentFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is UpdateAppointmentEvent) {
        emit(
          SessionAppointmentLoading(),
        );
        try {
          String value = await SessionAppointmentServices().updateAppointment(
              event.idAddAppiontment, event.date, event.type);
          emit(SessionAppointmentSuccess(successmsg: value));
        } catch (e) {
          emit(
            SessionAppointmentFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is DeleteAppiontmentEvent) {
        emit(
          SessionAppointmentLoading(),
        );
        try {
          String value = await SessionAppointmentServices()
              .deleteAppointment(event.idDemand, event.date, event.type);
          emit(SessionAppointmentSuccess(successmsg: value));
        } catch (e) {
          emit(
            SessionAppointmentFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    });
  }
}
