import '../models/lawyer_model.dart';
import '../services/lawyer_services.dart';

class LawyerRepository {
  Future<List<LawyerModel>> getAllLawyers() async {
    var lawyersList = await LawyerServices().getAllLawyers();
    return lawyersList
        .map(
          (e) => LawyerModel.fromJson(e),
    )
        .toList();
  }

  Future<LawyerModel> getLawyerById(int lawyerId) async {
    var lawyerData = await LawyerServices().getLawyerById(lawyerId);
    return LawyerModel.fromJson(lawyerData);
  }
}
