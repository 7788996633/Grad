import 'package:bloc/bloc.dart';
import '../../data/models/issue_request_model.dart';
import '../../data/repositories/issue_request_repository.dart';
import '../../data/services/issue_requests_services.dart';
import 'issue_requests_event.dart';
import 'issue_requests_state.dart';

class IssueRequestsBloc extends Bloc<IssueRequestsEvent, IssueRequestsState> {
  IssueRequestsBloc() : super(IssueRequestsInitial()) {
    on<IssueRequestsEvent>((event, emit) async {
      if (event is CreateIssueRequestsEvent) {
        emit(IssueRequestsLoading());
        try {
          String value = await IssueRequestsServices().addIssueRequest(
            event.title,
            event.description,
          );
          emit(IssueRequestsSuccess(successmsg: value));
        } catch (e) {
          emit(IssueRequestsFail(errmsg: e.toString()));
        }
      }

      else if (event is GetAllIssueRequests) {
        emit(IssueRequestsLoading());
        try {
          List<IssueRequestModel> issueRequestsList = await IssueRequestRepository().getIssueRequests();
          emit(IssueRequestsListLoaded(issueRequestsList: issueRequestsList));
        } catch (e) {
          emit(IssueRequestsFail(errmsg: e.toString()));
        }
      }

      else if (event is GetIssueRequestsById) {
        emit(IssueRequestsLoading());
        try {
          IssueRequestModel issueRequest = await IssueRequestRepository().getIssueRequestById(event.issueRequestsId);
          emit(IssueRequestsByIdLoaded(issueRequestModel: issueRequest));
        } catch (e) {
          emit(IssueRequestsFail(errmsg: e.toString()));
        }
      }

      else if (event is DeleteIssueRequestByIdEvent) {
        emit(IssueRequestsLoading());
        try {
          String successMsg = await IssueRequestsServices().deleteIssueRequest(event.issueRequestId);
          emit(IssueRequestsSuccess(successmsg: successMsg));
        } catch (e) {
          emit(IssueRequestsFail(errmsg: e.toString()));
        }
      }

      else if (event is UpdateIssueRequestEvent) {
        emit(IssueRequestsLoading());
        try {
          String value = await IssueRequestsServices().updateIssueRequest(
            event.title,
            event.description,
            event.issueRequestId,
          );
          emit(IssueRequestsSuccess(successmsg: value));
        } catch (e) {
          emit(IssueRequestsFail(errmsg: e.toString()));
        }
      }
    });
  }
}
