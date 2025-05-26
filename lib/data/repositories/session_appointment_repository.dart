import 'package:graduation/data/models/client_session_model.dart';
import 'package:graduation/data/services/session_appointment_services.dart';

class SessionAppointmentRepository {
  Future<List<Session>> getAllSeesion(int idIssue) async {
    var demandList = await SessionAppointmentServices()
        .getAllAppointmentsBySessionId(idIssue);
    return demandList
        .map(
          (e) => Session.fromJson(e),
        )
        .toList();
  }
}
