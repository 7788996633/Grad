
import '../models/lawyer_model.dart';
import '../services/lawyer_services.dart';

class LawyerRepository {
  // Future<String?> _getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }

  Future<List<LawyerModel>> getAllLawyers() async {
    var lawyersList = await LawyerServices().getAllLawyers();
    return lawyersList
        .map(
          (e) => LawyerModel.fromJson(e),
        )
        .toList();
  }
}
