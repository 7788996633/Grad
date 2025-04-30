import 'package:graduation/data/models/issues_model.dart';
import 'package:graduation/data/services/issus_services.dart';

class IssuesRepository {
  Future<List<IssuesModel>> getAllIssues() async {
    var issueList = await IssusServices().issueShowAllServices();
    return issueList
        .map(
          (e) => IssuesModel.fromJson(e),
        )
        .toList();
  }
}
