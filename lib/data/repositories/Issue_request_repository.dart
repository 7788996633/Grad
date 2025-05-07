import '../models/issue_request_model.dart';
import '../services/issue_requests_services.dart';

class IssueRequestRepository {
  Future<List<IssueRequestModel>> getIssueRequests() async {
    var issueRequestsList = await IssueRequestsServices().getIssueRequests();
    return issueRequestsList.map((e) => IssueRequestModel.fromJson(e)).toList();
  }

  Future<IssueRequestModel> getIssueRequestById(int issueRequestId) async {
    var issueRequestData =
        await IssueRequestsServices().getIssueRequestById(issueRequestId);
    return IssueRequestModel.fromJson(issueRequestData);
  }
}
