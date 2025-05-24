/*import 'package:bloc/bloc.dart';
import '../../data/models/sessions.dart';
import '../../data/repositories/sessions_repository.dart';
import '../../data/services/sessions_services.dart';
import 'sessions_event.dart';
import 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  SessionsBloc() : super(SessionsInitial()) {
    on<SessionsEvent>((event, emit) async {
      if (event is CreateSessionsEvent) {
        emit(SessionsLoading());
        try {
          String result = await SessionServices().createSession(
            event.type,
            event.lawyerId,
            event.isAttend,
            event.sessionId,
          );
          emit(SessionsSuccess(successmsg: result));
        } catch (e) {
          emit(SessionsFail(errmsg: e.toString()));
        }
      } else if (event is GetAllSessionsEvent) {
        emit(SessionsLoading());
        try {
          List<Sessions> sessionsList = await SessionsRepository().getSessions();
          emit(SessionsListLoaded(sessionsList: sessionsList));
        } catch (e) {
          emit(SessionsFail(errmsg: e.toString()));
        }
      } else if (event is GetSessionsByIdEvent) {
        emit(SessionsLoading());
        try {
          Sessions session = await SessionServices().getSessionById(event.sessionId);
          emit(SessionLoadedSuccessfully(session: session));
        } catch (e) {
          emit(SessionsFail(errmsg: e.toString()));
        }
      } else if (event is DeleteSessionEvent) {
        emit(SessionsLoading());
        try {
          String result = await SessionServices().deleteSession(event.sessionId);
          emit(SessionsSuccess(successmsg: result));
        } catch (e) {
          emit(SessionsFail(errmsg: e.toString()));
        }
      } else if (event is UpdateSessionEvent) {
        emit(SessionsLoading());
        try {
          String result = await SessionServices().updateSession(
            event.outcome,
            event.isAttend,
            event.sessionId,
          );
          emit(SessionsSuccess(successmsg: result));
        } catch (e) {
          emit(SessionsFail(errmsg: e.toString()));
        }
      }
    });
  }
}
*/