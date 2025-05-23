import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:graduation/data/models/issues_model.dart';
import 'package:graduation/data/repositories/Show_Client_Issus_repository.dart';

part 'show_client_issue_event.dart';
part 'show_client_issue_state.dart';

class ShowClientIssueBloc
    extends Bloc<ShowClientIssueEvent, ShowClientIssueState> {
  ShowClientIssueBloc() : super(ShowClientIssueInitial()) {
    on<ShowClientIssueEvent>((event, emit) async {
      if (event is ShowClientIssue) {
        emit(ShowClientIssuesLoading());
        try {
          var value = await ShowClientIssusRepository().getAllIssues();
          emit(
            ShowClientIssuesListLoadedSuccessFully(
              issues: value,
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
