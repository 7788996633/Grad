import '../models/hiring_request_model.dart';
import '../models/lawyer_model.dart';
import '../services/hiring_requests_services.dart';
import '../services/lawyer_services.dart';

class HiringRequestRepository {
  Future<List<HiringRequestModel>> getHiringRequests() async {
    var hiringRequestsList = await HiringRequestsServices ().getHiringRequests();
    return  hiringRequestsList
        .map(
          (e) => HiringRequestModel.fromJson(e),)
        .toList();
  }

  Future<HiringRequestModel> getHiringRequestById(int hiringRequestId) async {
    var hiringRequestData = await HiringRequestsServices().getHiringRequestById(hiringRequestId);
    return HiringRequestModel.fromJson(hiringRequestData);

  }
}
