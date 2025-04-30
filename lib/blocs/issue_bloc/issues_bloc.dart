import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:graduation/data/models/issues_model.dart';
import 'package:graduation/data/services/issus_services.dart';
import 'package:graduation/data/repositories/issues_repository.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  IssuesBloc() : super(IssuesInitial()) {
    on<IssuesEvent>((event, emit) async {
      if (event is IssueAdd) {
        try {
          String value = await IssusServices().issueAddService(
            event.id,
            event.title,
            event.issueNumber,
            event.category,
            event.courtName,
            event.status,
            event.priority,
            event.startDate,
            event.endDate,
            event.totalCost,
            event.numberOfPayments,
            event.opponentName,
          );
          emit(
            IssuesSuccess(
              successmsg: value,
            ),
          );
        } catch (e) {
          emit(
            IssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is IssueUpdate) {
        try {
          String value = await IssusServices().issueUpdateService(
              event.id,
              event.title,
              event.issueNumber,
              event.category,
              event.courtName,
              event.status,
              event.priority,
              event.startDate,
              event.endDate,
              event.totalCost,
              event.numberOfPayments,
              event.opponentName);
          emit(
            IssuesSuccess(
              successmsg: value,
            ),
          );
        } catch (e) {
          emit(
            IssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is Issuedelete) {
        try {
          String value = await IssusServices().issueDeleteService(event.id);
          emit(
            IssuesSuccess(
              successmsg: value,
            ),
          );
        } catch (e) {
          emit(
            IssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is IssuesShow) {
        try {
          List<IssuesModel> value = await IssuesRepository().getAllIssues();
          emit(
            IssuesListSuccessFully(
              issues: value,
            ),
          );
        } catch (e) {
          emit(
            IssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      } else if (event is IssueShowbyId) {
        try {
          IssuesModel value = await IssusServices().issueShowService(event.id);
          emit(
            IssuesSuccessFully(issue: value),
          );
        } catch (e) {
          emit(
            IssuesFail(
              errmsg: e.toString(),
            ),
          );
        }
      }
    });
  }
}
