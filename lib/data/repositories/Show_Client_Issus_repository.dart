import 'package:graduation/data/models/issues_model.dart';
import 'package:graduation/data/services/Show_Client_Issus_Services.dart';

class ShowClientIssusRepository {
  Future<List<IssuesModel>> getAllIssues() async {
    var issue = await ShowClientIssusServices().showClientIssusServices();
    return issue
        .map(
          (e) => IssuesModel.fromJson(e),
        )
        .toList();
  }
}
