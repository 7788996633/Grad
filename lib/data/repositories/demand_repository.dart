import 'package:graduation/data/models/demand_model.dart';
import 'package:graduation/data/services/demand_services.dart';

class DemandRepository {
  Future<List<DemandModel>> getAllDemands(int idIssue) async {
    var demandList = await DemandServices().getAllDemandByIssueId(idIssue);
    return demandList
        .map(
          (e) => DemandModel.fromJson(e),
        )
        .toList();
  }
}
