import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:graduation/data/models/client_session_model.dart';
import 'package:graduation/data/repositories/Show_Client_Session_Repository.dart';

part 'show_client_sessions_event.dart';
part 'show_client_sessions_state.dart';

class ShowClientSessionsBloc
    extends Bloc<ShowClientSessionsEvent, ShowClientSessionsState> {
  ShowClientSessionsBloc() : super(ShowClientSessionsInitial()) {
    on<ShowClientSessionsEvent>((event, emit) async {
      if (event is ShowClientSessions) {
        emit(ShowClientIssuesLoading());
        try {
          var value = await ShowClientSessionRepository().getAllClientSession();
          emit(
            ShowClientIssuesListLoadedSuccessFully(
              clientsession: value,
            ),
          );
        } catch (e) {
          emit(
            ShowClientIssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    });
  }
}
